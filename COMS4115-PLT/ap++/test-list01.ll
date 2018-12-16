; ModuleID = 'AP_PlusPlus'
source_filename = "AP_PlusPlus"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

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
  %a = alloca { i32, i32, i32* }
  %list.size = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %a, i32 0, i32 0
  store i32 0, i32* %list.size
  %list.size2 = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %a, i32 0, i32 1
  store i32 0, i32* %list.size2
  %list.arry = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %a, i32 0, i32 2
  %p = alloca i32, i32 1000
  store i32* %p, i32** %list.arry
  %b = alloca { i32, i32, i32* }
  %list.size1 = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %b, i32 0, i32 0
  store i32 0, i32* %list.size1
  %list.size22 = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %b, i32 0, i32 1
  store i32 0, i32* %list.size22
  %list.arry3 = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %b, i32 0, i32 2
  %p4 = alloca i32, i32 1000
  store i32* %p4, i32** %list.arry3
  %c = alloca { i32, i32, i32* }
  %list.size5 = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %c, i32 0, i32 0
  store i32 0, i32* %list.size5
  %list.size26 = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %c, i32 0, i32 1
  store i32 0, i32* %list.size26
  %list.arry7 = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %c, i32 0, i32 2
  %p8 = alloca i32, i32 1000
  store i32* %p8, i32** %list.arry7
  %a9 = load { i32, i32, i32* }, { i32, i32, i32* }* %a
  store { i32, i32, i32* } %a9, { i32, i32, i32* }* %b
  call void @list_pushint({ i32, i32, i32* }* %a, i32 101)
  call void @list_pushint({ i32, i32, i32* }* %a, i32 102)
  call void @list_pushint({ i32, i32, i32* }* %a, i32 103)
  %list_get = call i32 @list_getint({ i32, i32, i32* }* %a, i32 0)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get)
  %list_get10 = call i32 @list_getint({ i32, i32, i32* }* %a, i32 1)
  %printf11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get10)
  %list_get12 = call i32 @list_getint({ i32, i32, i32* }* %a, i32 2)
  %printf13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get12)
  %list_get14 = call i32 @list_getint({ i32, i32, i32* }* %b, i32 1)
  %printf15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get14)
  br label %while

while:                                            ; preds = %while_body, %entry
  %list_size18 = call i32 @list_sizeint({ i32, i32, i32* }* %a)
  %tmp = icmp sgt i32 %list_size18, 0
  br i1 %tmp, label %while_body, label %merge

while_body:                                       ; preds = %while
  %list_pop = call i32 @list_popint({ i32, i32, i32* }* %a)
  %printf16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_pop)
  %list_size = call i32 @list_sizeint({ i32, i32, i32* }* %a)
  %printf17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_size)
  br label %while

merge:                                            ; preds = %while
  %list_size19 = call i32 @list_sizeint({ i32, i32, i32* }* %a)
  %printf20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_size19)
  call void @list_setint({ i32, i32, i32* }* %a, i32 0, i32 5)
  %list_get21 = call i32 @list_getint({ i32, i32, i32* }* %a, i32 0)
  %printf22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get21)
  ret i32 0
}
