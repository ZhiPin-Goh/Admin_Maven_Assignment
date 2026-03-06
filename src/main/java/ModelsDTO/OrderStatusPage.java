package ModelsDTO;

public class OrderStatusPage {
    private int Preparing;
    private int CompletedToday;
    private int Completed;
    public OrderStatusPage(int Preparing, int CompletedToday, int Completed){
        this.Preparing = Preparing;
        this.CompletedToday = CompletedToday;
        this.Completed = Completed;
    }

    public int getPreparing() {
        return Preparing;
    }

    public int getCompletedToday() {
        return CompletedToday;
    }

    public int getCompleted() {
        return Completed;
    }
}
