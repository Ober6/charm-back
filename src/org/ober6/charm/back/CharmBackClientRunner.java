package org.ober6.charm.back;


import java.io.IOException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.URI;
import java.net.http.HttpResponse;
import java.util.stream.Collectors;

public class CharmBackClientRunner {
    public static void main(String[] args) throws IOException, InterruptedException {
        try (HttpClient httpClient = HttpClient.newBuilder().version(HttpClient.Version.HTTP_1_1).build()) {

//            HttpRequest request = HttpRequest.newBuilder(URI.create("http://yandex.ru"))
//                    .setHeader("My-Token", "zxcvbnm")
//                    .POST(HttpRequest.BodyPublishers.ofString("dsa")).
//                    build();

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create("http://localhost:8080/profile?id=1"))
                    .GET()
                    .build();

//           HttpResponse<String> httpResponse = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
//            Map<String, List<String>> map = httpResponse.headers().map();
//            System.out.println(httpResponse.statusCode());
//            System.out.println();
//            System.out.println(map);
//            System.out.println(httpResponse.body());

            HttpResponse<byte[]> response = httpClient.send(request, HttpResponse.BodyHandlers.ofByteArray());
            HttpClient.Version version = response.version();
            int statusCode = response.statusCode();

            String headers = response.headers().map().entrySet().stream().map(Object::toString).collect(
                    Collectors.joining()
            );
            String body = new String(response.body());
            System.out.println(version + " " + statusCode + "\n" + headers + "\n\n" + body);
        }
    }
}
