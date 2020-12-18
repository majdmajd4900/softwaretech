import java.util.*;

public class A{

	public static  int sum(ArrayList<Integer> numbersArray ){
		int sumOfNumbers = 0;
		for(int x = 0 ; x<numbersArray.size(); x++){
			System.out.println(numbersArray.get(x));
			sumOfNumbers += numbersArray.get(x);
		}

		

		return sumOfNumbers;
		}


		public static  int average(int summation ,int number ){
			
	
	
			return summation/number;
			}


		
	public static void main(String args[]) 
	{	 
		Scanner sc = new Scanner(System.in); 
		System.out.println("Enter your No: "); 
		int no = sc.nextInt(); 
		System.out.println("you entered : "+no); 

ArrayList<Integer> numbersArray = new ArrayList<Integer>();
boolean isThereIdenticalNumbers= false;
for(int i = 0 ; i< no; i++){
Scanner sc2 = new Scanner(System.in); 
		System.out.println("Enter No: "+(i+1)); 
		int numberEnter = sc2.nextInt(); 
		System.out.println("you entered : " + numberEnter);
		if(numbersArray.contains(numberEnter)){
			isThereIdenticalNumbers = true;
		}
System.out.println("you entered : " + numbersArray.add(numberEnter));  



}



int summation = sum(numbersArray);
System.out.println("Summation og the folllowing numbers is " + summation);

int averageOfNumbers =  average(summation , numbersArray.size());

System.out.println("The average of  numbers is " + averageOfNumbers);

System.out.println("Is thier two identical numbers " + isThereIdenticalNumbers);


	}  

	


}