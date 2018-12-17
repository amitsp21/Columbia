; ModuleID = 'AP_PlusPlus'
source_filename = "AP_PlusPlus"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.4 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.5 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

define i1 @list_getbool({ i32, i32, i1* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i1* }*
  store { i32, i32, i1* }* %0, { i32, i32, i1* }** %list_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %list_load = load { i32, i32, i1* }*, { i32, i32, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, i1* }, { i32, i32, i1* }* %list_load, i32 0, i32 2
  %array_load = load i1*, i1** %list_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %list_arry_element_ptr = getelementptr i1, i1* %array_load, i32 %idx_load
  %list_array_element_ptr = load i1, i1* %list_arry_element_ptr
  ret i1 %list_array_element_ptr
}

define i32 @list_getint({ i32, i32, i32* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i32* }*
  store { i32, i32, i32* }* %0, { i32, i32, i32* }** %list_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %list_load = load { i32, i32, i32* }*, { i32, i32, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %list_load, i32 0, i32 2
  %array_load = load i32*, i32** %list_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %list_arry_element_ptr = getelementptr i32, i32* %array_load, i32 %idx_load
  %list_array_element_ptr = load i32, i32* %list_arry_element_ptr
  ret i32 %list_array_element_ptr
}

define double @list_getfloat({ i32, i32, double* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i32, double* }*
  store { i32, i32, double* }* %0, { i32, i32, double* }** %list_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %list_load = load { i32, i32, double* }*, { i32, i32, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, double* }, { i32, i32, double* }* %list_load, i32 0, i32 2
  %array_load = load double*, double** %list_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %list_arry_element_ptr = getelementptr double, double* %array_load, i32 %idx_load
  %list_array_element_ptr = load double, double* %list_arry_element_ptr
  ret double %list_array_element_ptr
}

define void @list_setbool({ i32, i32, i1* }*, i32, i1) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i1* }*
  store { i32, i32, i1* }* %0, { i32, i32, i1* }** %list_ptr_alloc
  %list_load = load { i32, i32, i1* }*, { i32, i32, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, i1* }, { i32, i32, i1* }* %list_load, i32 0, i32 2
  %list_array_load = load i1*, i1** %list_array_ptr
  %list_arry_next_element_ptr = getelementptr i1, i1* %list_array_load, i32 %1
  store i1 %2, i1* %list_arry_next_element_ptr
  ret void
}

define void @list_setint({ i32, i32, i32* }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i32* }*
  store { i32, i32, i32* }* %0, { i32, i32, i32* }** %list_ptr_alloc
  %list_load = load { i32, i32, i32* }*, { i32, i32, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %list_load, i32 0, i32 2
  %list_array_load = load i32*, i32** %list_array_ptr
  %list_arry_next_element_ptr = getelementptr i32, i32* %list_array_load, i32 %1
  store i32 %2, i32* %list_arry_next_element_ptr
  ret void
}

define void @list_setfloat({ i32, i32, double* }*, i32, double) {
entry:
  %list_ptr_alloc = alloca { i32, i32, double* }*
  store { i32, i32, double* }* %0, { i32, i32, double* }** %list_ptr_alloc
  %list_load = load { i32, i32, double* }*, { i32, i32, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, double* }, { i32, i32, double* }* %list_load, i32 0, i32 2
  %list_array_load = load double*, double** %list_array_ptr
  %list_arry_next_element_ptr = getelementptr double, double* %list_array_load, i32 %1
  store double %2, double* %list_arry_next_element_ptr
  ret void
}

define void @list_pushbool({ i32, i32, i1* }*, i1) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i1* }*
  store { i32, i32, i1* }* %0, { i32, i32, i1* }** %list_ptr_alloc
  %val_alloc = alloca i1
  store i1 %1, i1* %val_alloc
  %list_load = load { i32, i32, i1* }*, { i32, i32, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, i1* }, { i32, i32, i1* }* %list_load, i32 0, i32 2
  %list_array_load = load i1*, i1** %list_array_ptr
  %list_alloc_size = getelementptr inbounds { i32, i32, i1* }, { i32, i32, i1* }* %list_load, i32 0, i32 0
  %list_size = getelementptr inbounds { i32, i32, i1* }, { i32, i32, i1* }* %list_load, i32 0, i32 1
  %list_size1 = load i32, i32* %list_size
  %list_arry_next_element_ptr = getelementptr i1, i1* %list_array_load, i32 %list_size1
  %list_arry_next_element = load i1, i1* %list_arry_next_element_ptr
  %inc_size = add i32 %list_size1, 1
  store i32 %inc_size, i32* %list_size
  %val = load i1, i1* %val_alloc
  store i1 %val, i1* %list_arry_next_element_ptr
  ret void
}

define void @list_pushint({ i32, i32, i32* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i32* }*
  store { i32, i32, i32* }* %0, { i32, i32, i32* }** %list_ptr_alloc
  %val_alloc = alloca i32
  store i32 %1, i32* %val_alloc
  %list_load = load { i32, i32, i32* }*, { i32, i32, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %list_load, i32 0, i32 2
  %list_array_load = load i32*, i32** %list_array_ptr
  %list_alloc_size = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %list_load, i32 0, i32 0
  %list_size = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %list_load, i32 0, i32 1
  %list_size1 = load i32, i32* %list_size
  %list_arry_next_element_ptr = getelementptr i32, i32* %list_array_load, i32 %list_size1
  %list_arry_next_element = load i32, i32* %list_arry_next_element_ptr
  %inc_size = add i32 %list_size1, 1
  store i32 %inc_size, i32* %list_size
  %val = load i32, i32* %val_alloc
  store i32 %val, i32* %list_arry_next_element_ptr
  ret void
}

define void @list_pushfloat({ i32, i32, double* }*, double) {
entry:
  %list_ptr_alloc = alloca { i32, i32, double* }*
  store { i32, i32, double* }* %0, { i32, i32, double* }** %list_ptr_alloc
  %val_alloc = alloca double
  store double %1, double* %val_alloc
  %list_load = load { i32, i32, double* }*, { i32, i32, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, double* }, { i32, i32, double* }* %list_load, i32 0, i32 2
  %list_array_load = load double*, double** %list_array_ptr
  %list_alloc_size = getelementptr inbounds { i32, i32, double* }, { i32, i32, double* }* %list_load, i32 0, i32 0
  %list_size = getelementptr inbounds { i32, i32, double* }, { i32, i32, double* }* %list_load, i32 0, i32 1
  %list_size1 = load i32, i32* %list_size
  %list_arry_next_element_ptr = getelementptr double, double* %list_array_load, i32 %list_size1
  %list_arry_next_element = load double, double* %list_arry_next_element_ptr
  %inc_size = add i32 %list_size1, 1
  store i32 %inc_size, i32* %list_size
  %val = load double, double* %val_alloc
  store double %val, double* %list_arry_next_element_ptr
  ret void
}

define i1 @list_popbool({ i32, i32, i1* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i1* }*
  store { i32, i32, i1* }* %0, { i32, i32, i1* }** %list_ptr_alloc
  %list_load = load { i32, i32, i1* }*, { i32, i32, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, i1* }, { i32, i32, i1* }* %list_load, i32 0, i32 2
  %list_array_load = load i1*, i1** %list_array_ptr
  %list_size_ptr = getelementptr inbounds { i32, i32, i1* }, { i32, i32, i1* }* %list_load, i32 0, i32 1
  %list_size = load i32, i32* %list_size_ptr
  %dec_size = sub i32 %list_size, 1
  %list_arry_next_element_ptr = getelementptr i1, i1* %list_array_load, i32 %dec_size
  %list_arry_next_element = load i1, i1* %list_arry_next_element_ptr
  store i32 %dec_size, i32* %list_size_ptr
  ret i1 %list_arry_next_element
}

define i32 @list_popint({ i32, i32, i32* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i32* }*
  store { i32, i32, i32* }* %0, { i32, i32, i32* }** %list_ptr_alloc
  %list_load = load { i32, i32, i32* }*, { i32, i32, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %list_load, i32 0, i32 2
  %list_array_load = load i32*, i32** %list_array_ptr
  %list_size_ptr = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %list_load, i32 0, i32 1
  %list_size = load i32, i32* %list_size_ptr
  %dec_size = sub i32 %list_size, 1
  %list_arry_next_element_ptr = getelementptr i32, i32* %list_array_load, i32 %dec_size
  %list_arry_next_element = load i32, i32* %list_arry_next_element_ptr
  store i32 %dec_size, i32* %list_size_ptr
  ret i32 %list_arry_next_element
}

define double @list_popfloat({ i32, i32, double* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i32, double* }*
  store { i32, i32, double* }* %0, { i32, i32, double* }** %list_ptr_alloc
  %list_load = load { i32, i32, double* }*, { i32, i32, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32, double* }, { i32, i32, double* }* %list_load, i32 0, i32 2
  %list_array_load = load double*, double** %list_array_ptr
  %list_size_ptr = getelementptr inbounds { i32, i32, double* }, { i32, i32, double* }* %list_load, i32 0, i32 1
  %list_size = load i32, i32* %list_size_ptr
  %dec_size = sub i32 %list_size, 1
  %list_arry_next_element_ptr = getelementptr double, double* %list_array_load, i32 %dec_size
  %list_arry_next_element = load double, double* %list_arry_next_element_ptr
  store i32 %dec_size, i32* %list_size_ptr
  ret double %list_arry_next_element
}

define i32 @list_sizebool({ i32, i32, i1* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i1* }*
  store { i32, i32, i1* }* %0, { i32, i32, i1* }** %list_ptr_alloc
  %list_load = load { i32, i32, i1* }*, { i32, i32, i1* }** %list_ptr_alloc
  %list_size = getelementptr inbounds { i32, i32, i1* }, { i32, i32, i1* }* %list_load, i32 0, i32 1
  %list_size1 = load i32, i32* %list_size
  ret i32 %list_size1
}

define i32 @list_sizeint({ i32, i32, i32* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i32* }*
  store { i32, i32, i32* }* %0, { i32, i32, i32* }** %list_ptr_alloc
  %list_load = load { i32, i32, i32* }*, { i32, i32, i32* }** %list_ptr_alloc
  %list_size = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %list_load, i32 0, i32 1
  %list_size1 = load i32, i32* %list_size
  ret i32 %list_size1
}

define i32 @list_sizefloat({ i32, i32, double* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i32, double* }*
  store { i32, i32, double* }* %0, { i32, i32, double* }** %list_ptr_alloc
  %list_load = load { i32, i32, double* }*, { i32, i32, double* }** %list_ptr_alloc
  %list_size = getelementptr inbounds { i32, i32, double* }, { i32, i32, double* }* %list_load, i32 0, i32 1
  %list_size1 = load i32, i32* %list_size
  ret i32 %list_size1
}

define i32 @main() {
entry:
  %a = alloca i32
  %add_result = call i32 @add(i32 39, i32 3)
  store i32 %add_result, i32* %a
  %a1 = load i32, i32* %a
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %a1)
  ret i32 0
}

define i32 @add(i32 %a, i32 %b) {
entry:
  %a1 = alloca i32
  store i32 %a, i32* %a1
  %b2 = alloca i32
  store i32 %b, i32* %b2
  %a3 = load i32, i32* %a1
  %b4 = load i32, i32* %b2
  %tmp = add i32 %a3, %b4
  ret i32 %tmp
}
