from flask import Flask, render_template
import boto3

app = Flask(__name__)

@app.route("/")
def dashboard():
    s3 = boto3.client("s3")
    buckets = s3.list_buckets()["Buckets"]
    compliance = [{"name": bucket["Name"], "status": "Compliant"} for bucket in buckets]

    gd = boto3.client("guardduty")
    detector_id = gd.list_detectors()["DetectorIds"][0]
    findings = gd.list_findings(DetectorId=detector_id)["FindingIds"]

    return render_template("dashboard.html", compliance=compliance, findings=len(findings))

if __name__ == "__main__":
    app.run(debug=True)

