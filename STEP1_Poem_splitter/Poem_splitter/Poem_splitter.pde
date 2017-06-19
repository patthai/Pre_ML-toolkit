PrintWriter CSV;
String final_output ="";
String[] input_text;
int count = 0;
int file = 1;
int split_line_count = 4;
String poem_title="";
String poet_class = "suicidal";
String fourline ="";
int count_poem  = 0;
int id = 000;
int wordcount;

void setup() 
  {
    CSV = createWriter("output2/"+poet_class+".csv");
    
for (int x = 1 ; x < 12; x++)

     {
      file = x;
      input_text = loadStrings("input/" + poet_class +  "/" + file + ".txt");
    
            for (int i = 1 ; i < input_text.length; i++) 
              {
               
                String line = input_text[i];
                line = line.trim().replaceAll(" +", " ");
                
                if (line.trim().equals("")){}
                else   
                    {    
                         line = line.replaceAll(",","\\.");
                         
                         
                         
                         
                           
                             println(line+"___________________"+count);
                              
                              if (line.charAt(0) == '>')
                                {
                                
                                 wordcount = countWords(fourline);
                                 if (wordcount > 0 )
                                   {
                                   CSV.println(poet_class+ id +",Poet_"+file+","+poet_class+","+poem_title + "," + "poem#" + count_poem + ", sample_id#" + id +","+fourline + "," + wordcount);
                                   }
                                 count_poem ++;
                                 id++;
                                 count = 0;
                                 fourline ="";
                                 poem_title = line;
                                 
                                }
                              else if (count <= split_line_count)
                                {
                                  fourline = fourline + " " + line;
                                  count++;
                                  
                                }
                              else
                                {
                                  println(fourline);
                                  count = 0;
                                  i--;
                                  wordcount = countWords(fourline);
                                  if (wordcount > 0 )
                                   {
                                   CSV.println(poet_class+ id +",Poet_"+file+","+poet_class+","+poem_title + "," + "poem#" + count_poem + ", sample_id#" + id +","+fourline + "," + wordcount);
                                   }
                                   id++;
                                 fourline ="";
                                 
                                 
                                }
                           
                         }
                        
                           
                           
                     } 
              
                                                     
               }
               wordcount = countWords(fourline);
              CSV.println(poet_class+ id +",Poet_"+file+","+poet_class+","+poem_title + "," + "poem#" + count_poem + ", sample_id#" + id +","+fourline + "," + wordcount);
                                
               
               id++;                                                         
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
  

public static int countWords(String s){

    int wordCount = 0;

    boolean word = false;
    int endOfLine = s.length() - 1;

    for (int i = 0; i < s.length(); i++) {
        // if the char is a letter, word = true.
        if (Character.isLetter(s.charAt(i)) && i != endOfLine) {
            word = true;
            // if char isn't a letter and there have been letters before,
            // counter goes up.
        } else if (!Character.isLetter(s.charAt(i)) && word) {
            wordCount++;
            word = false;
            // last word of String; if it doesn't end with a non letter, it
            // wouldn't count without this.
        } else if (Character.isLetter(s.charAt(i)) && i == endOfLine) {
            wordCount++;
        }
    }
    return wordCount;
}



