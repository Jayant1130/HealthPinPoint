package Model;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import javax.servlet.http.Part;

public class Doctor {
    int DoctorID, Active;
    String Spe_in,  HealthID;
        Part ClinicProof, DegreeProof;
    byte[] RClinicProof, RDegreeProof ;

    public int getActive() {
        return Active;
    }

    public void setActive(int Active) {
        this.Active = Active;
    }

    
    public int getDoctorID() {
        return DoctorID;
    }

    public void setDoctorID(int DoctorID) {
        this.DoctorID = DoctorID;
    }

    public String getSpe_in() {
        return Spe_in;
    }

    public void setSpe_in(String Spe_in) {
        this.Spe_in = Spe_in;
    }

    public Part getClinicProof() {
        return ClinicProof;
    }

    public void setClinicProof(Part ClinicProof) {
        this.ClinicProof = ClinicProof;
    }

    public String getRClinicProof() {
        String t = Base64.getEncoder().encodeToString(RClinicProof);
        return "data:image/jpg;base64," + t;
    }

    public void setRClinicProof(Blob blob) throws SQLException {
        this.RClinicProof = blob.getBytes(1, (int) blob.length());
    }
    
    public Part getDegreeProof() {
        return DegreeProof;
    }

    public void setDegreeProof(Part Photo) {
        this.DegreeProof = Photo;
    }

    public String getRDegreeProof() {
        String t = Base64.getEncoder().encodeToString(RDegreeProof);
        return "data:image/jpg;base64," + t;
    }

    public void setRDegreeProof(Blob blob) throws SQLException {
        this.RDegreeProof = blob.getBytes(1, (int) blob.length());
    }

    public String getHealthID() {
        return HealthID;
    }

    public void setHealthID(String HealthID) {
        this.HealthID = HealthID;
    }
            
}
