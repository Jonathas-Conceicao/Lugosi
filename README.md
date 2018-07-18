# Lugosi
An Lugosi compiler using javacc

-  Task
	1. [x] Implement Parser
		- [ ] refactor the language
	2. [ ] Generate Syntactic Tree
		- [ ] Define classes for the language
	3. [ ] Pretty Printer for Lugosi
	4. [ ] Compile Lugosi to another language
	5. [ ] Make tree example programs in Lugosi

Tips from teacher:
``` Java
import java.util.ArrayList;

class Lugosi {
	Main main;
	ArrayList <Func> funcs;
}

class Main {
	ArrayList <VarDecl> decls;
	ArrayList <Commands> commands;
}

class VarDecl {
	String id;
	Type tipo;
}

class Type {}
class Int extends Type {}
class Bool extends Type {}
```
