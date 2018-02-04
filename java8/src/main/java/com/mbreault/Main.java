package com.mbreault;

import org.apache.commons.io.IOUtils;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

// 1. HTTP GET example.com
// 2. Regex title out of HTML
// 3. Reverse string
// 4. Write to a text file.

public class Main {

    public static String step1() {

        // 1. HTTP GET example.com
        String response = null;

        InputStream in = null;
        try {
            in = new URL("http://example.com").openStream();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            try {
                response = IOUtils.toString(in);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } finally {
            IOUtils.closeQuietly(in);
        }

        return response;
    }


    public static String step2(final String response)
    {
        // 2. Regex title out of HTML
        Pattern pattern = Pattern.compile("<title>(.*)</title>");
        Matcher matcher = pattern.matcher(response);
        matcher.find();

        return matcher.group(1);
    }

    public static String step3(final String response)
    {
        // 3. Reverse string
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(response);

        return stringBuilder.reverse().toString();
    }

    public static void step4(final String response) {

        // 4. Write to a text file.
        Path outfile = Paths.get("output.txt");
        try {
            Files.write(outfile, response.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        String response = step1();
        response = step2(response);
        response = step3(response);
        step4(response);
    }
}
