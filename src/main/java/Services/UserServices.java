package Services;

import Models.User;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class UserServices {
    private static final String BASE_URL = "http://localhost:5018/api/ManageUser/";


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

    public List<User> getAllUser() throws Exception {
        URL url = new URL(BASE_URL + "GetAllUsers");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.connect();

        InputStream inputStream = connection.getInputStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            result.append(line);
        }
        reader.close();

        JSONArray array = new JSONArray(result.toString());
        List<User> list = new ArrayList<>();

        for (int i = 0; i < array.length(); i++) {
            JSONObject obj = array.getJSONObject(i);

            int id = obj.getInt("id");
            String username = obj.optString("userName", "N/A");
            String email = obj.optString("email", "N/A");
            String phonenumber = obj.optString("phoneNumber", "N/A");
            String password = obj.optString("password", "");
            int otp = obj.optInt("otp", 0);
            String status = obj.optString("status", "N/A");
            String usercode = obj.optString("userCode", "N/A");

            list.add(new User(id, email, username, phonenumber, password, otp, status, usercode));
        }
        return list;
    }

    public String UnActiveUser(int id) throws Exception{
        URL url = new URL(BASE_URL + "UnActiveUser/" + id);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");

        return getResponseFromConnection(connection);
    }

    public String ActiveUser(int id) throws Exception {
        URL url = new URL(BASE_URL + "ActiveUser/" + id);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");

        return getResponseFromConnection(connection);
    }

    public String SendEmailOTP(String email) throws Exception{
        URL url = new URL(BASE_URL + "SendEmailOTP");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);

        JSONObject obj = new JSONObject();
        obj.put("Email", email);

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(obj.toString().getBytes("UTF-8"));
        outputStream.close();

        return getResponseFromConnection(connection);
    }

}