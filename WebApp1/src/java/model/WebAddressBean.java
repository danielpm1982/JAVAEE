package model;
public class WebAddressBean implements WebAddressBeanInterface{
    private String webAddress;
    private String emailAddress;
    private String name;
    private String address;
    
    public WebAddressBean() {
    }

    @Override
    public String getWebAddress() {
        return webAddress;
    }
    @Override
    public void setWebAddress(String webAddress) {
        this.webAddress = webAddress;
    }
    @Override
    public String getEmailAddress() {
        return emailAddress;
    }
    @Override
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
    @Override
    public String getName() {
        return name;
    }
    @Override
    public void setName(String name) {
        this.name = name;
    }
    @Override
    public String getAddress() {
        return address;
    }
    @Override
    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "webAddress: "+webAddress+" emailAddress: "+emailAddress+" name: "+name+" address: "+address+".";
    }
}
