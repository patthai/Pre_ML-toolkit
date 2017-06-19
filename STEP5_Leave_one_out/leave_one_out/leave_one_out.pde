PrintWriter CSV_train;
PrintWriter CSV_test;

String input_name = "total_input";
String[] input_file;
String[] class_name = {
                      "non-suicidal_Poet_1", 
                      "non-suicidal_Poet_2",
                      "non-suicidal_Poet_3", 
                      "non-suicidal_Poet_4",
                      "non-suicidal_Poet_5", 
                      "non-suicidal_Poet_6",
                      "non-suicidal_Poet_7", 
                      "non-suicidal_Poet_8",
                      "non-suicidal_Poet_9", 
                      "non-suicidal_Poet_10",
                      "non-suicidal_Poet_11",
                      "suicidal_Poet_1", 
                      "suicidal_Poet_2",
                      "suicidal_Poet_3", 
                      "suicidal_Poet_4",
                      "suicidal_Poet_5", 
                      "suicidal_Poet_6",
                      "suicidal_Poet_7", 
                      "suicidal_Poet_8",
                      "suicidal_Poet_9", 
                      "suicidal_Poet_10",
                      "suicidal_Poet_11",
                     
                      };
int count = 0; // remove from train to test


void setup() 
  {
    input_file = loadStrings("input/"+ input_name + ".csv");
    for (int e = 0; e < class_name.length ; e++)
    {
     
     CSV_test = createWriter("output/EXP4_fold_"+(count+1)+"_without_sample_"+class_name[count]+"/test/test.csv"); 
     CSV_train = createWriter("output/EXP4_fold_"+(count+1)+"_without_sample_"+class_name[count]+"/train/train.csv");
     
     
     
     println( count);
     
     for (int i = 0 ; i < input_file.length; i++) 
              {
              
                 String[] field = split(input_file[i], ',');
                 if (field[1].equals(class_name[count]) == false)
                   { 
                    println("train");
                    CSV_train.println(field[3]+ "," + field[2]);
                   //CSV_train.println(field[1]+ "," +field[2]+ "," + field[3]);
                   }
                 else 
                   {
                    println("test");
                    CSV_test.println(field[3]+ "," +field[2]);
                    //CSV_test.println(field[1]+ "," +field[2]+ "," + field[3]);
                   }
              }
              count++;
              CSV_train.flush(); // Writes the remaining data to the file
              CSV_test.flush(); // Writes the remaining data to the file
              CSV_train.close(); // Finishes the file
              CSV_test.close(); // Finishes the file         
    } 
    
  }
  
  void draw() 
   {
  
    }
    
  void keyPressed() 
  {

   CSV_train.flush(); // Writes the remaining data to the file
   CSV_test.flush(); // Writes the remaining data to the file
   CSV_train.close(); // Finishes the file
   CSV_test.close(); // Finishes the file
  
 
  exit(); // Stops the program
  }
