package Services;

import Models.Beverage;
import ModelsDTO.EditBeverageDTO;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class BeverageServices {
    private static final String BASE_URL = "http://localhost:5018/api/ManageBeverages/";
    private void addFormField(PrintWriter writer, String boundary, String name, String value) {
        writer.append("--").append(boundary).append("\r\n");
        writer.append("Content-Disposition: form-data; name=\"").append(name).append("\"\r\n\r\n");
        writer.append(value).append("\r\n");
        writer.flush();
    }
    private String getResponseFromConnection(HttpURLConnection connection) throws Exception {
        int responseCode = connection.getResponseCode();
        InputStream inputStream;

        // 1. 选频道
        if (responseCode >= 200 && responseCode < 300) {
            inputStream = connection.getInputStream();
        } else {
            inputStream = connection.getErrorStream();
        }

        // 2. 读数据
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();

        String responseMsg = response.toString();

        // 3. 决定结果
        if (responseCode >= 200 && responseCode < 300) {
            return responseMsg; // 成功，返回消息
        } else {
            throw new Exception(responseMsg); // 失败，抛出异常
        }
    }

    public List<Beverage> getAllBeverage() throws Exception {
        URL url = new URL(BASE_URL + "GetAllBeverages");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.connect();

        int responseCode = connection.getResponseCode();
        if (responseCode != 200) {
            System.out.println("Error: Server returned status code " + responseCode);
            return new ArrayList<>();
        }
        InputStream inputStream = connection.getInputStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            result.append(line);
        }
        reader.close();

        JSONArray array = new JSONArray(result.toString());
        List<Beverage> list = new ArrayList<>();

        for (int i = 0; i < array.length(); i++) {
            JSONObject obj = array.getJSONObject(i);
            int id = obj.getInt("id");
            String beveragename = obj.getString("beverageName");
            String beveragedescription = obj.optString("beverageDescription", "N/A");
            String beveragecategory = obj.optString("beverageCategory", "N/A");
            String beverageimagepath = obj.optString("beverageImagePath", "N/A");
            String beveragecode = obj.optString("beverageCode", "N/A");
            double price = obj.optDouble("price", 0);
            boolean isavailable = obj.optBoolean("isAvailable", false);
            boolean hashotoption = obj.optBoolean("hasHotOption", false);
            boolean hasiceoption = obj.optBoolean("hasIceOption", false);
            list.add(new Beverage(id, beveragename, beveragedescription, beveragecategory, beverageimagepath, beveragecode, price, isavailable,hasiceoption,hashotoption));
        }
        return list;
    }
    public String CreateBeverage(String name, String desc, String category, BigDecimal price,
                                 boolean hot, boolean ice, InputStream imageStream, String fileName) throws Exception {
        String boundary = "----WebKitFormBoundary" + System.currentTimeMillis();
        URL url = new URL(BASE_URL + "CreateBeverages");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        try (OutputStream outputStream = connection.getOutputStream();
             PrintWriter writer = new PrintWriter(new OutputStreamWriter(outputStream, "UTF-8"), true)) {
            addFormField(writer, boundary, "BeverageName", name != null ? name : "");
            addFormField(writer, boundary, "BeverageDescription", desc != null ? desc : "");
            addFormField(writer, boundary, "BeverageCategory", category != null ? category : "");
            addFormField(writer, boundary, "Price", String.valueOf(price));
            addFormField(writer, boundary, "HasHotOption", String.valueOf(hot));
            addFormField(writer, boundary, "HasIceOption", String.valueOf(ice));

            writer.append("--").append(boundary).append("\r\n");
            writer.append("Content-Disposition: form-data; name=\"BeverageImagePath\"; filename=\"").append(fileName).append("\"\r\n");
            writer.append("Content-Type: application/octet-stream\r\n\r\n");
            writer.flush();

            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = imageStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
            writer.append("\r\n").flush();
            writer.append("--").append(boundary).append("--\r\n");
            writer.flush();
        }
        return getResponseFromConnection(connection);
    }
    public String UpdateBeverage(EditBeverageDTO beverage) throws Exception{
        URL url = new URL(BASE_URL + "UpdateBeverage");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        JSONObject obj = new JSONObject();
        obj.put("ID", beverage.getId());
        obj.put("beveragename", beverage.getBeverageName());
        obj.put("beveragedescription", beverage.getBeverageDescription());
        obj.put("beveragecategory", beverage.getBeverageCategory());
        obj.put("price", beverage.getPrice());
        obj.put("hashotoption", beverage.isHasIceOption());
        obj.put("hasiceoption", beverage.isHasIceOption());

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(obj.toString().getBytes("UTF-8"));
        outputStream.close();

        int responseCode = connection.getResponseCode();
        InputStream inputStream;
        if (responseCode >= 200 && responseCode <300){
            inputStream = connection.getInputStream();
        }
        else{
            inputStream = connection.getErrorStream();
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null){
            response.append(line);
        }
        reader.close();
        String responseMsg = response.toString();
        System.out.println("Status Code: " + responseCode);
        System.out.println("Server Message: "+ responseMsg);
        if (responseCode == 200){
            return responseMsg;
        }else {
            throw  new Exception(responseMsg);
        }
    }
    public  String DeleteBeverage(int id) throws Exception{
        URL url = new URL(BASE_URL + "DeleteBeverage/" + id);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        int responseCode = connection.getResponseCode();
        InputStream inputStream;
        if (responseCode >= 200 && responseCode <300){
            inputStream = connection.getInputStream();
        }
        else{
            inputStream = connection.getErrorStream();
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null){
            response.append(line);
        }
        reader.close();
        String responseMsg = response.toString();
        System.out.println("Status Code: " + responseCode);
        System.out.println("Server Message: "+ responseMsg);
        if (responseCode == 200){
            return responseMsg;
        }else {
            throw new Exception(responseMsg);
        }
    }
    public String BeverageUnAvailable(int id) throws Exception{
        URL url = new URL(BASE_URL + "BeverageUnAvailable/" + id);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");

        int responseCode = connection.getResponseCode();
        InputStream inputStream;
        if (responseCode >= 200 && responseCode <300){
            inputStream = connection.getInputStream();
        }
        else{
            inputStream = connection.getErrorStream();
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null){
            response.append(line);
        }
        reader.close();
        String responseMsg = response.toString();
        System.out.println("Status Code: " + responseCode);
        System.out.println("Server Message: "+ responseMsg);
        if (responseCode == 200){
            return responseMsg;
        }else {
            throw new Exception(responseMsg);
        }
    }
    public String BeverageAvailable(int id) throws Exception{
        URL url = new URL(BASE_URL + "BeverageAvailable/" + id);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");

        int responseCode = connection.getResponseCode();
        InputStream inputStream;
        if (responseCode >= 200 && responseCode <300){
            inputStream = connection.getInputStream();
        }
        else{
            inputStream = connection.getErrorStream();
        }

        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null){
            response.append(line);
        }
        reader.close();
        String responseMsg = response.toString();
        System.out.println("Status Code: " + responseCode);
        System.out.println("Server Message: "+ responseMsg);
        if (responseCode == 200){
            return responseMsg;
        }else {
            throw new Exception(responseMsg);
        }
    }
}
