package ModelsDTO;

import java.math.BigDecimal;
import java.util.List;

public class DashboardDTO {
    private BigDecimal totalRevenue;
    private int todayOrderCount;
    private int preparingCount;
    public DashboardDTO(BigDecimal totalRevenue, int todayOrderCount, int preparingCount){
        this.totalRevenue = totalRevenue;
        this.todayOrderCount = todayOrderCount;
        this.preparingCount = preparingCount;
    }
    public BigDecimal getTotalRevenue(){return totalRevenue;}
    public int getTodayOrderCount(){return todayOrderCount;}
    public int getPreparingCount(){return preparingCount;}
}
