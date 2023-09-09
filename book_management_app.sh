#! /bin/bash
add_book()
{
read -p "enter name of the book you want to add: " b_name
books[$i]=$b_name
let i++
echo "$b_name added succesfully"
}
delete_book()
{
	read -p "enter the name of the book to delete" book_delete
	available="no"
	for index in ${!books[@]}
	do
		if [ $book_delete = ${books[$index]} ];then
			available="yes"
			unset books[$index]
			echo "$book_delete deleted succesfully"
			break
		fi
	done
	if [ $available = no ]; then
		echo "books does not exist"
	fi
}

list_book()
{
if [ ${#books[@]} -eq 0 ]; then 
	echo "no books are available"
	return 1
fi
echo "list of all books"
echo "-----------------------------------------------------------------------"
for book in ${books[@]}
do
	echo $book
done
}
echo "Welcome To Book Management Application"
echo "------------------------------------------------------------------------"
declare -a books
i=0
while [ true ]
do
read -p "which operation do u want to perform :[add|delete|list|exit]:" option
case $option in 
	add)
		add_book
		;;
	delete)
		delete_book
		;;
	list)
		list_book
		;;
	exit)
		echo "thanks for using our application"
		exit 0
		;;
	*)

		echo "wrong option,try again"
esac
done

