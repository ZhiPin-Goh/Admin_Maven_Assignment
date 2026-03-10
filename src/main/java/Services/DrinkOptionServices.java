package Services;

import Models.IceLevels;
import Models.Sizes;
import Models.SugarLevels;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class DrinkOptionServices {
    private static final String BASE_URL = "http://localhost:5018/api/ManageDrinkOption/";
    private String getResponseFromConnection(HttpURLConnection connection) throws Exception {
        int responseCode = connection.getResponseCode();
        InputStream inputStream;
        if (responseCode >= 200 && responseCode < 300) {
            inputStream = connection.getInputStream();
        } else {
            inputStream = connection.getErrorStream();
        }
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();

        String responseMsg = response.toString();
        if (responseCode >= 200 && responseCode < 300) {
            return responseMsg;
        } else {
            throw new Exception(responseMsg);
        }
    }
    public List<Sizes> GetDrinkSize() throws Exception {
        URL url = new URL(BASE_URL + "GetSizes");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        InputStream inputStream = connection.getInputStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            result.append(line);
        }
        reader.close();

        JSONArray array = new JSONArray(result.toString());
        List<Sizes> list = new ArrayList<>();

        for (int i = 0; i < array.length(); i++) {
            JSONObject obj = array.getJSONObject(i);
            int id = obj.optInt("id", obj.optInt("ID", 0));
            String size = obj.optString("beverageSize", obj.optString("BeverageSize", ""));
            Double price = obj.optDouble("priceModifier", obj.optDouble("PriceModifier", 0.0));
            list.add(new Sizes(id, size, BigDecimal.valueOf(price)));
        }
        return list;
    }

    public List<IceLevels> GetDrinkIce() throws Exception {
        URL url = new URL(BASE_URL + "GetIceLevels");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        InputStream inputStream = connection.getInputStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            result.append(line);
        }
        reader.close();

        JSONArray array = new JSONArray(result.toString());
        List<IceLevels> list = new ArrayList<>();

        for (int i = 0; i < array.length(); i++) {
            JSONObject obj = array.getJSONObject(i);
            int id = obj.optInt("id", obj.optInt("ID", 0));
            String iceOption = obj.optString("iceOption", obj.optString("IceOption", ""));
            list.add(new IceLevels(id, iceOption));
        }
        return list;
    }

    public List<SugarLevels> GetDrinkSugar() throws Exception {
        URL url = new URL(BASE_URL + "GetSugarLevels");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        InputStream inputStream = connection.getInputStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            result.append(line);
        }
        reader.close();

        JSONArray array = new JSONArray(result.toString());
        List<SugarLevels> list = new ArrayList<>();

        for (int i = 0; i < array.length(); i++) {
            JSONObject obj = array.getJSONObject(i);
            int id = obj.optInt("id", obj.optInt("ID", 0));
            String sugarOption = obj.optString("sugarOption", obj.optString("SugarOption", ""));
            list.add(new SugarLevels(id, sugarOption));
        }
        return list;
    }

    public String CreateSize(Sizes sizes) throws Exception{
        URL url = new URL(BASE_URL + "CreateSize");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        JSONObject obj = new JSONObject();
        obj.put("ID", 0);
        obj.put("BeverageSize", sizes.getBeverageSize());
        obj.put("PriceModifier", sizes.getPriceModifier());

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(obj.toString().getBytes("UTF-8"));
        outputStream.close();
        return getResponseFromConnection(connection);
    }

    public String CreateIceLevel(IceLevels iceLevels) throws Exception{
        URL url = new URL(BASE_URL + "CreateIceLevel");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        JSONObject obj = new JSONObject();
        obj.put("ID", 0);
        obj.put("IceLevel", iceLevels.getIceOption());

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(obj.toString().getBytes("UTF-8"));
        outputStream.close();
        return getResponseFromConnection(connection);
    }

    public String CreateSugarLevel(SugarLevels sugarLevels) throws Exception{
        URL url = new URL(BASE_URL + "CreateSugarLevel");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        JSONObject obj = new JSONObject();
        obj.put("ID", 0);
        obj.put("SugarLevel", sugarLevels.getSugarOption());

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(obj.toString().getBytes("UTF-8"));
        outputStream.close();
        return getResponseFromConnection(connection);
    }
    public String DeleteSize(int id) throws Exception{
        URL url = new URL(BASE_URL + "DeleteSize/" + id);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setRequestProperty("Content-Type", "application/json");

        return getResponseFromConnection(connection);
    }
    public String DeleteIceLevel(int id) throws Exception{
        URL url = new URL(BASE_URL + "DeleteIceLevel/" + id);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setRequestProperty("Content-Type", "application/json");

        return getResponseFromConnection(connection);
    }
    public String DeleteSugarLevel(int id) throws Exception{
        URL url = new URL(BASE_URL + "DeleteSugarLevel/" + id);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setRequestProperty("Content-Type", "application/json");

        return getResponseFromConnection(connection);
    }
}
