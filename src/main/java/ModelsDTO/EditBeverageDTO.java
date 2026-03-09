package ModelsDTO;

import java.math.BigDecimal;

public class EditBeverageDTO {
    private int id;
    private String beverageName;
    private String beverageDescription;
    private String beverageCategory;
    private BigDecimal price;
    private boolean hasIceOption;
    private boolean hasHotOption;
    public EditBeverageDTO(int id, String beverageName, String beverageDescription, String beverageCategory, BigDecimal price, boolean hasIceOption, boolean hasHotOption){
        this.id=id;
        this.beverageName=beverageName;
        this.beverageDescription=beverageDescription;
        this.beverageCategory=beverageCategory;
        this.price=price;
        this.hasIceOption=hasIceOption;
        this.hasHotOption=hasHotOption;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBeverageName() {
        return beverageName;
    }

    public void setBeverageName(String beverageName) {
        this.beverageName = beverageName;
    }

    public String getBeverageDescription() {
        return beverageDescription;
    }

    public void setBeverageDescription(String beverageDescription) {
        this.beverageDescription = beverageDescription;
    }

    public String getBeverageCategory() {
        return beverageCategory;
    }

    public void setBeverageCategory(String beverageCategory) {
        this.beverageCategory = beverageCategory;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public boolean isHasIceOption() {
        return hasIceOption;
    }

    public void setHasIceOption(boolean hasIceOption) {
        this.hasIceOption = hasIceOption;
    }

    public boolean isHasHotOption() {
        return hasHotOption;
    }

    public void setHasHotOption(boolean hasHotOption) {
        this.hasHotOption = hasHotOption;
    }
}
