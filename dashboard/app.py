import os
import streamlit as st
import snowflake.connector
import pandas as pd

st.set_page_config(page_title="Mortgage Underwriting KPIs", layout="wide")
st.title("Mortgage Underwriting Dashboard")
st.caption("Demo dashboard. Configure Snowflake environment variables before use.")

@st.cache_data(ttl=300)
def load_decisions():
    conn = snowflake.connector.connect(
        account=os.environ["SNOWFLAKE_ACCOUNT"],
        user=os.environ["SNOWFLAKE_USER"],
        password=os.environ["SNOWFLAKE_PASSWORD"],
        warehouse=os.getenv("SNOWFLAKE_WAREHOUSE", "MORTGAGE_TRANSFORM_WH"),
        database=os.getenv("SNOWFLAKE_DATABASE", "MORTGAGE_DB"),
        schema="GOLD",
    )
    try:
        return pd.read_sql(
            "SELECT APPLICATION_ID, LTV_PCT, DTI_PCT, FICO_SCORE, DECISION, REASON_CODE "
            "FROM UNDERWRITING_DECISIONS", conn
        )
    finally:
        conn.close()

if st.button("Refresh metrics"):
    st.cache_data.clear()

try:
    df = load_decisions()
    c1, c2, c3 = st.columns(3)
    c1.metric("Applications", len(df))
    c2.metric("Approved", int((df["DECISION"] == "APPROVED").sum()))
    c3.metric("Declined", int((df["DECISION"] == "DECLINED").sum()))
    st.subheader("Decision distribution")
    st.bar_chart(df["DECISION"].value_counts())
    st.subheader("Decline reasons")
    st.bar_chart(df.loc[df.DECISION == "DECLINED", "REASON_CODE"].value_counts())
    st.subheader("Decision details")
    st.dataframe(df, use_container_width=True)
except Exception as exc:
    st.warning(f"Dashboard is not connected yet. Check Snowflake configuration and table deployment. Details: {exc}")
