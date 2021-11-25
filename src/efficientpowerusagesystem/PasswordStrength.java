/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package efficientpowerusagesystem;

/**
 *
 * @author mnpem
 */
public class PasswordStrength {
    public static String checkStr(String inputPassword){
        int uppercase = 0;
        int lowercase = 0;
        int specialcharacters = 0;
        int digits = 0;
        String str;
        char[] Password = inputPassword.toCharArray();
        for (int index = 0; index < inputPassword.length(); index++)
        {
            if (Character.isUpperCase(Password[index]))
            {
                uppercase = 1;
            }
            if (Character.isLowerCase(Password[index]))
            {
                lowercase = 1;
            }
            if (Character.isDigit(Password[index]))
            {
                digits = 1;
            }
        }
        if (inputPassword.contains("~") || inputPassword.contains("!") || inputPassword.contains("@")
            || inputPassword.contains("#") || inputPassword.contains("$") || inputPassword.contains("%")
            || inputPassword.contains("^") || inputPassword.contains("&") || inputPassword.contains("*")) ;
        {
            specialcharacters = 1;
        }
        if (inputPassword.length() >= 8 && uppercase==1 && lowercase==1 && specialcharacters==1 && digits==1){

            str = "Strong";
            return str;
        }
        if (inputPassword.length() >= 8 && uppercase==1 && lowercase==1){

            str = "Medium";
            return str;
        }
        if (inputPassword.length() >= 8){

            str = "Weak";
            return str;
        }
        if (inputPassword.length() < 8){

            str = "Too Short";
            return str;
        }
        str = "";
        return str;

    }
}
