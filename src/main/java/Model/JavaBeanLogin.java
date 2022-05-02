
package Model;

import java.io.Serializable;

public class JavaBeanLogin implements Serializable {

    private static final long serialVersionUID = 1L;
    private String username;
    private String password;
    private int partyId;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPartyId() {
        return partyId;
    }

    public void setPartyId(int partyId) {
        this.partyId = partyId;
    }
}

