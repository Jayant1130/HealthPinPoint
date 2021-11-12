package Model;

public class HealthIssue {
    String DateTime, HealthID, Complaint, Duration, Diseases, OriginOfCause, TroubleTable;
    int HealthIssueID, Major;

    public int getMajor() {
        return Major;
    }

    public void setMajor(int Major) {
        this.Major = Major;
    }
    

    public String getDateTime() {
        return DateTime;
    }

    public void setDateTime(String DateTime) {
        this.DateTime = DateTime;
    }

    public String getHealthID() {
        return HealthID;
    }

    public void setHealthID(String HealthID) {
        this.HealthID = HealthID;
    }

    public String getComplaint() {
        return Complaint;
    }

    public void setComplaint(String Complaint) {
        this.Complaint = Complaint;
    }

    public String getDuration() {
        return Duration;
    }

    public void setDuration(String Duration) {
        this.Duration = Duration;
    }

    public String getDiseases() {
        return Diseases;
    }

    public void setDiseases(String Diseases) {
        this.Diseases = Diseases;
    }

    public String getOriginOfCause() {
        return OriginOfCause;
    }

    public void setOriginOfCause(String OriginOfCause) {
        this.OriginOfCause = OriginOfCause;
    }

    public String getTroubleTable() {
        return TroubleTable;
    }

    public void setTroubleTable(String TroubleTable) {
        this.TroubleTable = TroubleTable;
    }

    public int getHealthIssueID() {
        return HealthIssueID;
    }

    public void setHealthIssueID(int HealthIssueID) {
        this.HealthIssueID = HealthIssueID;
    }
    
}
