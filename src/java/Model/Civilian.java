package Model;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import javax.servlet.http.Part;

public class Civilian {
        private int  CityID;
        private String HealthID, Name, MobileNo, Address, DOB, EmergencyNo,  
                Email, Religion, Diet, MaritalStatus; 
        Part Photo, AadharImage;
    byte[] RPhoto, RAadharImage ;

    
    public String getMaritalStatus() {
        return MaritalStatus;
    }

    public void setMaritalStatus(String MaritalStatus) {
        this.MaritalStatus = MaritalStatus;
    }

    public String getHealthID() {
        return HealthID;
    }

    public void setHealthID(String HealthID) {
        this.HealthID = HealthID;
    }

    public int getCityID() {
        return CityID;
    }

    public void setCityID(int CityID) {
        this.CityID = CityID;
    }


    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getMobileNo() {
        return MobileNo;
    }

    public void setMobileNo(String MobileNo) {
        this.MobileNo = MobileNo;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getEmergencyNo() {
        return EmergencyNo;
    }

    public void setEmergencyNo(String EmergencyNo) {
        this.EmergencyNo = EmergencyNo;
    }

    public Part getPhoto() {
        return Photo;
    }

    public void setPhoto(Part Photo) {
        this.Photo = Photo;
    }

    public String getRPhoto() {
        String t = Base64.getEncoder().encodeToString(RPhoto);
        return "data:image/jpg;base64," + t;
    }

    public void setRPhoto(Blob blob) throws SQLException {
        this.RPhoto = blob.getBytes(1, (int) blob.length());
    }
    
    public Part getAadharImage() {
        return AadharImage;
    }

    public void setAadharImage(Part AadharImage) {
        this.AadharImage = AadharImage;
    }

    public String getRAadharImage() {
        String t = Base64.getEncoder().encodeToString(RAadharImage);
        return "data:image/jpg;base64," + t;
    }

    public void setRAadharImage(Blob blob) throws SQLException {
        this.RAadharImage = blob.getBytes(1, (int) blob.length());
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getReligion() {
        return Religion;
    }

    public void setReligion(String Religion) {
        this.Religion = Religion;
    }

    public String getDiet() {
        return Diet;
    }

    public void setDiet(String Diet) {
        this.Diet = Diet;
    }

     
        
}
