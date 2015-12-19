import javax.swing.JOptionPane;  
import fisica.*;

public abstract class Level
{
   FWorld world;
   String messageOnLoad;
   boolean objectiveIsCompleted;
   boolean startSim;  
   
   public Level(FWorld w, String message)
   {
     world =w; 
     messageOnLoad = message; 
     objectiveIsCompleted = false; 
   }
   
   public Level()
   {
     world = null;
     messageOnLoad="";
     objectiveIsCompleted=false; 
   }
   
   public String showMessageOnLoad()
   {
     //JOptionPane.showMessageDialouge(messageOnLoad);
     return messageOnLoad;
   }
   
   abstract void updateLevel();
   
   abstract void reset(); 
   
   
   
   
  
  
}