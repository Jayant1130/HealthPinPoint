package Model;

public class Treatement {
      String DateTime, Diagnosis, MedicinePrescribed, Detail, Advice, Operation, OperationDetail;
      int TreatmentID, HealthIssueID, DoctorID, HospitalID;

    public String getDateTime() {
        return DateTime;
    }

    public void setDateTime(String DateTime) {
        this.DateTime = DateTime;
    }

    public String getDiagnosis() {
        return Diagnosis;
    }

    public void setDiagnosis(String Diagnosis) {
        this.Diagnosis = Diagnosis;
    }

    public String getMedicinePrescribed() {
        return MedicinePrescribed;
    }

    public void setMedicinePrescribed(String MedicinePrescribed) {
        this.MedicinePrescribed = MedicinePrescribed;
    }

    public String getDetail() {
        return Detail;
    }

    public void setDetail(String Detail) {
        this.Detail = Detail;
    }

    public String getAdvice() {
        return Advice;
    }

    public void setAdvice(String Advice) {
        this.Advice = Advice;
    }

    public String getOperation() {
        return Operation;
    }

    public void setOperation(String Operation) {
        this.Operation = Operation;
    }

    public String getOperationDetail() {
        return OperationDetail;
    }

    public void setOperationDetail(String OperationDetail) {
        this.OperationDetail = OperationDetail;
    }

    public int getTreatmentID() {
        return TreatmentID;
    }

    public void setTreatmentID(int TreatmentID) {
        this.TreatmentID = TreatmentID;
    }

    public int getHealthIssueID() {
        return HealthIssueID;
    }

    public void setHealthIssueID(int HealthIssueID) {
        this.HealthIssueID = HealthIssueID;
    }

    public int getDoctorID() {
        return DoctorID;
    }

    public void setDoctorID(int DoctorID) {
        this.DoctorID = DoctorID;
    }

    public int getHospitalID() {
        return HospitalID;
    }

    public void setHospitalID(int HospitalID) {
        this.HospitalID = HospitalID;
    }
      
}
