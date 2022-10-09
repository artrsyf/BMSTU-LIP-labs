function generateTree(elem) {
    var child = elem.firstElementChild;
    var ul = document.createElement('ul');
    while(child) {
        var li = document.createElement('li');
        li.innerHTML = child.tagName;
        var list = generateTree(child);
        li.appendChild(list);
        ul.appendChild(li);
        child = child.nextElementSibling;
    }
    elem.appendChild(ul);
    return ul;
}
function checkWrite(elem){
	document.write(document.documentElement.tagName == "HTML");
}
// function buildTree(elem){
// 	head = elem;
// 	var ul = document.createElement('ul'); 
// 	while(head) { // cycle working for every element in document
//         var li = document.createElement('li'); // creating il in document
//         li.innerHTML = head.tagName; // getting value in correct form to li;
//         count += 1;
//         var list = generateTree(head); //
//         li.appendChild(list);
//         ul.appendChild(li);
//         head = head.nextElementSibling;
//     }
//     document.documentElement.appendChild(ul);
//     return ul;
// }
var current = 1; // global variable for the only one entry into the condition
function buildTree(elem) {
	if (current == 1){
		var child = elem; // checking html node; works once in the process
		current = 0;
	}
	else{
		child = elem.firstElementChild; // the begin of consideration of all child nodes
	}
    console.log(child.tagName);
    var ul = document.createElement('ul'); // creating ul in document
    while(child) { // cycle working for every element in document
        var li = document.createElement('li'); // creating li in document
        li.innerHTML = child.tagName; // getting value in correct form to li
        var list = generateTree(child); // recursive traversal in child root
        li.appendChild(list); // adding descendants of child in local hierarchy
        ul.appendChild(li); // adding child in glogal hierarchy
        child = child.nextElementSibling; // changing to next sibling
    }
    elem.appendChild(ul); // adding all ul in document
    return ul;
}