def credit_bureau_file_ready(file_manifest):
    """Return True when a credit bureau source file is present in the manifest."""
    return any("credit_bureau_records" in name for name in file_manifest)
