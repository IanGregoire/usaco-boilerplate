#!/usr/bin/env ruby

module USACO
    def self.init
        self.getCommand
        self.gateKeeper
    end
    
    def self.getCommand
        @@command = ARGV[0] || "help"
    end
    
    def self.gateKeeper
        case @@command
            when "new" then self.doNew
            when "help" then self.doHelp
        end
    end
    
    def self.doNew
        File.write ARGV[1] + ".java", self.makeFile
    end
    
    def self.doHelp
        puts "No help yet!"
    end
    
    # Supporter methods
    def self.makeFile
        task = ARGV[1]
        id = ARGV[2]
"""/*
ID: #{id}
LANG: JAVA
TASK: #{task}
*/
import java.io.*;
import java.util.*;

class #{task} {
  public static final String TASK = \"#{task}\";
  public static void main(String[] args) throws IOException {
    List<StringTokenizer> in = getInput();
    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(TASK + \".out\")));
    // Your code goes here
    // Access each token with in.get(i).nextToken()
    
    // out.println();
    out.close();
  }
  
  public static List<StringTokenizer> getInput() throws IOException {
    BufferedReader f = new BufferedReader(new FileReader(TASK + \".in\"));
    
    List<StringTokenizer> lines = new ArrayList<StringTokenizer>();
    
    StringTokenizer line = new StringTokenizer(f.readLine());
    
    while(line != null) {
      lines.add(line);
      line = new StringTokenizer(f.readLine());
    }
    
    return lines;
  }
  
}
"""
    end
    
end

USACO.init
