PrintWriter CSV_0;
PrintWriter CSV_1;
PrintWriter CSV_total;
String match_name = "match";
String input_0_name = "non-suicidal_input";
String input_1_name = "suicidal";
String[] match_text;
String[] input_0_text;
String[] input_1_text;


void setup() 
  {
    CSV_0 = createWriter("output/output_" + input_0_name +".csv");
    CSV_1 = createWriter("output/output_" + input_1_name +".csv");
    CSV_total = createWriter("output/total_output.csv");
    
      match_text = loadStrings("input/"+ match_name + ".txt");
      input_0_text = loadStrings("input/"+ input_0_name + ".csv");
      input_1_text = loadStrings("input/"+ input_1_name + ".csv");
    
            for (int i = 0 ; i < match_text.length; i++) 
              {
                
                String match_line = match_text[i];
                
                //preprocess
                match_line = match_line.replaceAll("[{]","");
                match_line = match_line.replaceAll("[}]","");
                match_line = match_line.replaceAll("u'","");
                match_line = match_line.replaceAll("'","");
                match_line = match_line.replaceAll(":",",");
                
                //split front,back
               String[] match_couple = split(match_line, ',');
               match_couple[0] = match_couple[0].replaceAll(" ","");
               match_couple[1] = match_couple[0].replaceAll(" ","");
               
               
               
               //println(match_couple[0]);
               
               for (int x = 0 ; x < input_0_text.length; x++) 
                        {
                         String[] field_0 = split(input_0_text[x], ',');
                        
                         if (field_0[0].equals(match_couple[0]) == true)
                           {
                             CSV_0.println(field_0[0]+","+field_0[2]+"_"+field_0[1]+","+field_0[2]+","+field_0[6]+","+field_0[7]);
                         CSV_total.println(field_0[0]+","+field_0[2]+"_"+field_0[1]+","+field_0[2]+","+field_0[6]+","+field_0[7]);
                           
                           }
                        
                        }
              
              for (int y = 0 ; y < input_1_text.length; y++) 
                        {
                         String[] field_1 = split(input_1_text[y], ',');
                        
                         if (field_1[0].equals(match_couple[1]) == true)
                           {
                             CSV_1.println(field_1[0]+","+field_1[2]+"_"+field_1[1]+","+field_1[2]+","+field_1[6]+","+field_1[7]);
                         CSV_total.println(field_1[0]+","+field_1[2]+"_"+field_1[1]+","+field_1[2]+","+field_1[6]+","+field_1[7]);
                          
                           }
                        
                        }
                                   
               
  
              
            
          
        }
               println("done");
 
  }
void draw() 
   {
  
    }

void keyPressed() 
  {
  //CSV.println(final_output); 
  CSV_0.flush(); // Writes the remaining data to the file
  CSV_0.close(); // Finishes the file
  
  CSV_1.flush(); // Writes the remaining data to the file
  CSV_1.close(); // Finishes the file
  
  CSV_total.flush(); // Writes the remaining data to the file
  CSV_total.close(); // Finishes the file
  exit(); // Stops the program
  }





