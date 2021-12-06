package Model;

public class CivilianAdmit {
        String HealthID;
        int HospitalID;
        String AdmitDate, DischargeDate;

    public String getAdmitDate() {
        return AdmitDate;
    }

    public void setAdmitDate(String AdmitDate) {
        this.AdmitDate = AdmitDate;
    }

    public String getDischargeDate() {
        return DischargeDate;
    }

    public void setDischargeDate(String DischargeDate) {
        this.DischargeDate = DischargeDate;
    }

    public String getHealthID() {
        return HealthID;
    }

    public void setHealthID(String HealthID) {
        this.HealthID = HealthID;
    }

    public int getHospitalID() {
        return HospitalID;
    }

    public void setHospitalID(int HospitalID) {
        this.HospitalID = HospitalID;
    }
        
}
