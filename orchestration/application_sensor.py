def application_file_ready(file_manifest):
    """Return True when an application source file is present in the manifest."""
    return any("mortgage_applications" in name for name in file_manifest)
