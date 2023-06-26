package Asessement;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Stream;

public class lockedMe {

 public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	String directory = "C:\\Technical\\Java\\JavaProjects\\lockedMe";
//	Path path = Path.of(directory);
		
		int userResponse = 0;
		
		do 
		{
			System.out.println("Enter your choice:");
			System.out.println("1. Get file names in ascending order");
			System.out.println("2. Add a specified file");
			System.out.println("3. Delete a specified file ");
			System.out.println("4. Search a specified file");
			System.out.println("5. Return to menu");
			System.out.println("6. Exit the application!");
			
			Scanner sc = new Scanner(System.in);
			userResponse = sc.nextInt();
			
			switch(userResponse) {
			
			case 1:
				getFilesInAscendingOrder(directory);
				break;		
			case 2: 
				addFileToTheApplication(directory);
				break;
			case 3:
				deleteFilesFromTheApplication(directory);
				break;
			case 4:
				searchFile(directory);
				break;
			case 5:
				break;
			case 6:
				break;
					
			}
				
		}while(userResponse <= 5);
		
		
	
	
	
  }
	
  public static void getFilesInAscendingOrder(String filePath) {
	  
	  File fileDir = new File(filePath);
		
		if(fileDir.isDirectory()) {
			List listFile = Arrays.asList(fileDir.list());
			
			Collections.sort(listFile);
			
			System.out.println("Sorting by filename in ascending order");
			
				
			for(Object s:listFile){
				System.out.println(s.toString());
			}
			
		} 
  }
  
  public static void searchFile(String directory) {
	  
	  System.out.println("Enter the file to be searched!");
	  Scanner sc = new Scanner(System.in);  
	  String fileName = sc.nextLine();
	  
	  Path path = Path.of(directory+"//"+fileName);
	 
	  if(Files.exists(path)) {
		  System.out.println("File exists in the directory");
		  
	  }
	  else {
		  System.out.println("File does not exists in the directory"); 
	  }
	  
  }
	
  public static void addFileToTheApplication(String directory) {
	  
	  System.out.println("Enter the file to be added!");
	  Scanner sc = new Scanner(System.in);  
	  String fileName = sc.nextLine();
	  
	  File file = new File(directory+"\\"+fileName);
	  try {
		file.createNewFile();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	System.out.println("File Created!!");
	  
  }
	
  public static void deleteFilesFromTheApplication(String directory) {
	  
	  System.out.println("Enter the file to be deleted!");
	  
	  Scanner sc = new Scanner(System.in);  
	  String fileName = sc.nextLine();
	  
	  Path path = Path.of(directory+"\\"+fileName);
	  
	  try {
		  if(Files.exists(path)) {
			  Files.delete(path);
		  }
		  else {
			  System.out.println("File  not found!!");
		  }
		
		
		System.out.println("File deleted");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
	 
  }
  
}


