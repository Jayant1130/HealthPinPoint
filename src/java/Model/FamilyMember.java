package Model;

public class FamilyMember {
    String HealthID, Relationship, RelativeHealthID;
    int Status;

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }
    
    

    public String getHealthID() {
        return HealthID;
    }

    public void setHealthID(String HealthID) {
        this.HealthID = HealthID;
    }

    public String getRelationship() {
        return Relationship;
    }

    public void setRelationship(String Relationship) {
        this.Relationship = Relationship;
    }

    public String getRelativeHealthID() {
        return RelativeHealthID;
    }

    public void setRelativeHealthID(String RelativeHealthID) {
        this.RelativeHealthID = RelativeHealthID;
    }
    
}
