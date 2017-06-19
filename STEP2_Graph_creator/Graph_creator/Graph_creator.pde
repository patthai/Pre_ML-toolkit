PrintWriter CSV;
String input_1_name = "suicidal";
String input_2_name = "non_suicidal";
String[] input_1_text;
String[] input_2_text;
String io_folder = "split_by_one";


void setup() 
  {
   CSV = createWriter("output/" + io_folder + "/graph.csv");
    

      input_1_text = loadStrings("input/"+ io_folder + "/" + input_1_name + ".csv");
      input_2_text = loadStrings("input/"+ io_folder + "/" + input_2_name + ".csv");
    
            for (int i = 0 ; i < input_1_text.length; i++) 
              {
                
                
                
                
                    for (int j = 0 ; j < input_2_text.length; j++) 
                        {
                         String line_1 = input_1_text[i];
                         String[] field_1 = split(line_1, ',');
                         String input_id_1 = field_1[0];
                         
                         String line_2 = input_2_text[j];
                         String[] field_2 = split(line_2, ',');
                         String input_id_2 = field_2[0];
                         
                        
                         //similarity funtion
                         //println(field_1[6]);
                         int wordcount_1 =  Integer.parseInt(field_1[7]);
                         int wordcount_2 =  Integer.parseInt(field_2[7]);
                         int similarity = (-1* abs(wordcount_1 - wordcount_2))/1;
                         
                         //CSV.println (field_1[0] + "," + field_2[0]);
                         
                         //CSV.println ("G.add_edge('" + field_1[0] + "','" + field_2[0] + "',weight="+ similarity + ")");
                         CSV.println ( field_1[0] + "," + field_2[0] + ","+ similarity );
                         
                         
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
  CSV.flush(); // Writes the remaining data to the file
  CSV.close(); // Finishes the file
  exit(); // Stops the program
  }





