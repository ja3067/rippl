module L = Llvm
open Ast
open Tast
open Structs
open Lib

let initThunk_t : L.lltype =
	L.function_type (L.pointer_type struct_thunk_type)
		[| L.pointer_type struct_thunk_type
			; L.pointer_type eval_func_type 
                        ; i32_t ; i32_t |]

let initThunk : L.llvalue =
	L.declare_function "init_thunk" initThunk_t the_module

let initThunkLiteral_t : L.lltype =
	L.function_type (L.pointer_type struct_thunk_type)
		[| L.pointer_type i8_t |]
let initThunkLiteral : L.llvalue =
	L.declare_function "init_thunk_literal" initThunkLiteral_t the_module

let apply : L.llvalue =
	L.declare_function "apply" call_func_type the_module

let invoke : L.llvalue =
	L.declare_function "invoke" eval_func_type the_module


let struct_thunk = L.declare_global struct_thunk_type "Thunk" the_module
