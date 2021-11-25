
package efficientpowerusagesystem;

import javax.swing.JFrame;
public class EfficientPowerUsageSystem{  
    public static void main(String args[]){  
        LoginPage lp = new LoginPage();
        lp.setVisible(true);
        lp.pack();
        lp.setLocationRelativeTo(null);
        lp.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);   
}  
}