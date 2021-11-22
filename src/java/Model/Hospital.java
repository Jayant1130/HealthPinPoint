package Model;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import javax.servlet.http.Part;

public class Hospital {
    int HospitalID, CityID, Active;
    String HospitalName,Address, Email;
    Part SDocument;
    byte[] RSDocument;

        public Part getSDocument() {
        return SDocument;
    }

    public int getActive() {
        return Active;
    }

    public void setActive(int Active) {
        this.Active = Active;
    }

    public void setSDocument(Part SDocument) {
        this.SDocument = SDocument;
    }

    public String getRSDocument() {
        String t = Base64.getEncoder().encodeToString(RSDocument);
        return "data:image/jpg;base64," + t;
    }

    public void setRSDocument(Blob blob) throws SQLException {
        this.RSDocument = blob.getBytes(1, (int) blob.length());
    }

    public int getHospitalID() {
        return HospitalID;
    }

    public void setHospitalID(int HospitalID) {
        this.HospitalID = HospitalID;
    }

    public int getCityID() {
        return CityID;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    
    public void setCityID(int CityID) {
        this.CityID = CityID;
    }

    public String getHospitalName() {
        return HospitalName;
    }

    public void setHospitalName(String HospitalName) {
        this.HospitalName = HospitalName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }
    
}
