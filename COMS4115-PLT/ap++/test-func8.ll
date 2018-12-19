; ModuleID = 'AP_PlusPlus'
source_filename = "AP_PlusPlus"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.4 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.5 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

define i1 @list_getbool({ i32*, i1* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %list_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %list_load = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 1
  %array_load = load i1*, i1** %list_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %list_arry_element_ptr = getelementptr i1, i1* %array_load, i32 %idx_load
  %list_array_element_ptr = load i1, i1* %list_arry_element_ptr
  ret i1 %list_array_element_ptr
}

define i32 @list_getint({ i32*, i32* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %list_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %list_load = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 1
  %array_load = load i32*, i32** %list_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %list_arry_element_ptr = getelementptr i32, i32* %array_load, i32 %idx_load
  %list_array_element_ptr = load i32, i32* %list_arry_element_ptr
  ret i32 %list_array_element_ptr
}

define double @list_getfloat({ i32*, double* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %list_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %list_load = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 1
  %array_load = load double*, double** %list_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %list_arry_element_ptr = getelementptr double, double* %array_load, i32 %idx_load
  %list_array_element_ptr = load double, double* %list_arry_element_ptr
  ret double %list_array_element_ptr
}

define i8* @list_getstr({ i32*, i8** }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %list_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %list_load = load { i32*, i8** }*, { i32*, i8** }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %list_load, i32 0, i32 1
  %array_load = load i8**, i8*** %list_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %list_arry_element_ptr = getelementptr i8*, i8** %array_load, i32 %idx_load
  %list_array_element_ptr = load i8*, i8** %list_arry_element_ptr
  ret i8* %list_array_element_ptr
}

define void @list_setbool({ i32*, i1* }*, i32, i1) {
entry:
  %list_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %list_ptr_alloc
  %list_load = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 1
  %list_array_load = load i1*, i1** %list_array_ptr
  %list_arry_next_element_ptr = getelementptr i1, i1* %list_array_load, i32 %1
  store i1 %2, i1* %list_arry_next_element_ptr
  ret void
}

define void @list_setint({ i32*, i32* }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %list_ptr_alloc
  %list_load = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 1
  %list_array_load = load i32*, i32** %list_array_ptr
  %list_arry_next_element_ptr = getelementptr i32, i32* %list_array_load, i32 %1
  store i32 %2, i32* %list_arry_next_element_ptr
  ret void
}

define void @list_setfloat({ i32*, double* }*, i32, double) {
entry:
  %list_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %list_ptr_alloc
  %list_load = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 1
  %list_array_load = load double*, double** %list_array_ptr
  %list_arry_next_element_ptr = getelementptr double, double* %list_array_load, i32 %1
  store double %2, double* %list_arry_next_element_ptr
  ret void
}

define void @list_setstr({ i32*, i8** }*, i32, i8*) {
entry:
  %list_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %list_ptr_alloc
  %list_load = load { i32*, i8** }*, { i32*, i8** }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %list_load, i32 0, i32 1
  %list_array_load = load i8**, i8*** %list_array_ptr
  %list_arry_next_element_ptr = getelementptr i8*, i8** %list_array_load, i32 %1
  store i8* %2, i8** %list_arry_next_element_ptr
  ret void
}

define void @list_pushbool({ i32*, i1* }*, i1) {
entry:
  %list_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %list_ptr_alloc
  %val_alloc = alloca i1
  store i1 %1, i1* %val_alloc
  %list_load = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 1
  %list_array_load = load i1*, i1** %list_array_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %list_arry_next_element_ptr = getelementptr i1, i1* %list_array_load, i32 %list_size
  %inc_size = add i32 %list_size, 1
  store i32 %inc_size, i32* %list_size_ptr
  %val = load i1, i1* %val_alloc
  store i1 %val, i1* %list_arry_next_element_ptr
  ret void
}

define void @list_pushint({ i32*, i32* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %list_ptr_alloc
  %val_alloc = alloca i32
  store i32 %1, i32* %val_alloc
  %list_load = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 1
  %list_array_load = load i32*, i32** %list_array_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %list_arry_next_element_ptr = getelementptr i32, i32* %list_array_load, i32 %list_size
  %inc_size = add i32 %list_size, 1
  store i32 %inc_size, i32* %list_size_ptr
  %val = load i32, i32* %val_alloc
  store i32 %val, i32* %list_arry_next_element_ptr
  ret void
}

define void @list_pushfloat({ i32*, double* }*, double) {
entry:
  %list_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %list_ptr_alloc
  %val_alloc = alloca double
  store double %1, double* %val_alloc
  %list_load = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 1
  %list_array_load = load double*, double** %list_array_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %list_arry_next_element_ptr = getelementptr double, double* %list_array_load, i32 %list_size
  %inc_size = add i32 %list_size, 1
  store i32 %inc_size, i32* %list_size_ptr
  %val = load double, double* %val_alloc
  store double %val, double* %list_arry_next_element_ptr
  ret void
}

define void @list_pushstr({ i32*, i8** }*, i8*) {
entry:
  %list_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %list_ptr_alloc
  %val_alloc = alloca i8*
  store i8* %1, i8** %val_alloc
  %list_load = load { i32*, i8** }*, { i32*, i8** }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %list_load, i32 0, i32 1
  %list_array_load = load i8**, i8*** %list_array_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %list_arry_next_element_ptr = getelementptr i8*, i8** %list_array_load, i32 %list_size
  %inc_size = add i32 %list_size, 1
  store i32 %inc_size, i32* %list_size_ptr
  %val = load i8*, i8** %val_alloc
  store i8* %val, i8** %list_arry_next_element_ptr
  ret void
}

define i1 @list_popbool({ i32*, i1* }*) {
entry:
  %list_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %list_ptr_alloc
  %list_load = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 1
  %list_array_load = load i1*, i1** %list_array_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %dec_size = sub i32 %list_size, 1
  %list_arry_next_element_ptr = getelementptr i1, i1* %list_array_load, i32 %dec_size
  %list_arry_next_element = load i1, i1* %list_arry_next_element_ptr
  store i32 %dec_size, i32* %list_size_ptr
  ret i1 %list_arry_next_element
}

define i32 @list_popint({ i32*, i32* }*) {
entry:
  %list_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %list_ptr_alloc
  %list_load = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 1
  %list_array_load = load i32*, i32** %list_array_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %dec_size = sub i32 %list_size, 1
  %list_arry_next_element_ptr = getelementptr i32, i32* %list_array_load, i32 %dec_size
  %list_arry_next_element = load i32, i32* %list_arry_next_element_ptr
  store i32 %dec_size, i32* %list_size_ptr
  ret i32 %list_arry_next_element
}

define double @list_popfloat({ i32*, double* }*) {
entry:
  %list_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %list_ptr_alloc
  %list_load = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 1
  %list_array_load = load double*, double** %list_array_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %dec_size = sub i32 %list_size, 1
  %list_arry_next_element_ptr = getelementptr double, double* %list_array_load, i32 %dec_size
  %list_arry_next_element = load double, double* %list_arry_next_element_ptr
  store i32 %dec_size, i32* %list_size_ptr
  ret double %list_arry_next_element
}

define i8* @list_popstr({ i32*, i8** }*) {
entry:
  %list_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %list_ptr_alloc
  %list_load = load { i32*, i8** }*, { i32*, i8** }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %list_load, i32 0, i32 1
  %list_array_load = load i8**, i8*** %list_array_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %dec_size = sub i32 %list_size, 1
  %list_arry_next_element_ptr = getelementptr i8*, i8** %list_array_load, i32 %dec_size
  %list_arry_next_element = load i8*, i8** %list_arry_next_element_ptr
  store i32 %dec_size, i32* %list_size_ptr
  ret i8* %list_arry_next_element
}

define i32 @list_sizebool({ i32*, i1* }*) {
entry:
  %list_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %list_ptr_alloc
  %list_load = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  ret i32 %list_size
}

define i32 @list_sizeint({ i32*, i32* }*) {
entry:
  %list_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %list_ptr_alloc
  %list_load = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  ret i32 %list_size
}

define i32 @list_sizefloat({ i32*, double* }*) {
entry:
  %list_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %list_ptr_alloc
  %list_load = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  ret i32 %list_size
}

define i32 @list_sizestr({ i32*, i8** }*) {
entry:
  %list_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %list_ptr_alloc
  %list_load = load { i32*, i8** }*, { i32*, i8** }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i8** }, { i32*, i8** }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  ret i32 %list_size
}

define void @list_slicebool({ i32*, i1* }*, { i32*, i1* }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %list_ptr_alloc
  %list_ptr_ptr = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc
  %list_ptr_alloc2 = alloca { i32*, i1* }*
  store { i32*, i1* }* %1, { i32*, i1* }** %list_ptr_alloc2
  %list_ptr_ptr2 = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc2
  %idx_alloc = alloca i32
  store i32 %2, i32* %idx_alloc
  %idx_load = load i32, i32* %idx_alloc
  %idx_alloc1 = alloca i32
  store i32 %3, i32* %idx_alloc1
  %idx_load2 = load i32, i32* %idx_alloc1
  %loop_cnt = alloca i32
  store i32 0, i32* %loop_cnt
  %loop_upper_bound = sub i32 %idx_load2, %idx_load
  br label %while

while:                                            ; preds = %while_body, %entry
  %loop_cnt4 = load i32, i32* %loop_cnt
  %loop_cond = icmp sle i32 %loop_cnt4, %loop_upper_bound
  br i1 %loop_cond, label %while_body, label %merge

while_body:                                       ; preds = %while
  %to_idx = load i32, i32* %loop_cnt
  %from_idx = add i32 %to_idx, %idx_load
  %list_get = call i1 @list_getbool({ i32*, i1* }* %list_ptr_ptr, i32 %from_idx)
  call void @list_pushbool({ i32*, i1* }* %list_ptr_ptr2, i1 %list_get)
  %loop_cnt3 = load i32, i32* %loop_cnt
  %loop_itr = add i32 %loop_cnt3, 1
  store i32 %loop_itr, i32* %loop_cnt
  br label %while

merge:                                            ; preds = %while
  ret void
}

define void @list_sliceint({ i32*, i32* }*, { i32*, i32* }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %list_ptr_alloc
  %list_ptr_ptr = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc
  %list_ptr_alloc2 = alloca { i32*, i32* }*
  store { i32*, i32* }* %1, { i32*, i32* }** %list_ptr_alloc2
  %list_ptr_ptr2 = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc2
  %idx_alloc = alloca i32
  store i32 %2, i32* %idx_alloc
  %idx_load = load i32, i32* %idx_alloc
  %idx_alloc1 = alloca i32
  store i32 %3, i32* %idx_alloc1
  %idx_load2 = load i32, i32* %idx_alloc1
  %loop_cnt = alloca i32
  store i32 0, i32* %loop_cnt
  %loop_upper_bound = sub i32 %idx_load2, %idx_load
  br label %while

while:                                            ; preds = %while_body, %entry
  %loop_cnt4 = load i32, i32* %loop_cnt
  %loop_cond = icmp sle i32 %loop_cnt4, %loop_upper_bound
  br i1 %loop_cond, label %while_body, label %merge

while_body:                                       ; preds = %while
  %to_idx = load i32, i32* %loop_cnt
  %from_idx = add i32 %to_idx, %idx_load
  %list_get = call i32 @list_getint({ i32*, i32* }* %list_ptr_ptr, i32 %from_idx)
  call void @list_pushint({ i32*, i32* }* %list_ptr_ptr2, i32 %list_get)
  %loop_cnt3 = load i32, i32* %loop_cnt
  %loop_itr = add i32 %loop_cnt3, 1
  store i32 %loop_itr, i32* %loop_cnt
  br label %while

merge:                                            ; preds = %while
  ret void
}

define void @list_slicefloat({ i32*, double* }*, { i32*, double* }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %list_ptr_alloc
  %list_ptr_ptr = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc
  %list_ptr_alloc2 = alloca { i32*, double* }*
  store { i32*, double* }* %1, { i32*, double* }** %list_ptr_alloc2
  %list_ptr_ptr2 = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc2
  %idx_alloc = alloca i32
  store i32 %2, i32* %idx_alloc
  %idx_load = load i32, i32* %idx_alloc
  %idx_alloc1 = alloca i32
  store i32 %3, i32* %idx_alloc1
  %idx_load2 = load i32, i32* %idx_alloc1
  %loop_cnt = alloca i32
  store i32 0, i32* %loop_cnt
  %loop_upper_bound = sub i32 %idx_load2, %idx_load
  br label %while

while:                                            ; preds = %while_body, %entry
  %loop_cnt4 = load i32, i32* %loop_cnt
  %loop_cond = icmp sle i32 %loop_cnt4, %loop_upper_bound
  br i1 %loop_cond, label %while_body, label %merge

while_body:                                       ; preds = %while
  %to_idx = load i32, i32* %loop_cnt
  %from_idx = add i32 %to_idx, %idx_load
  %list_get = call double @list_getfloat({ i32*, double* }* %list_ptr_ptr, i32 %from_idx)
  call void @list_pushfloat({ i32*, double* }* %list_ptr_ptr2, double %list_get)
  %loop_cnt3 = load i32, i32* %loop_cnt
  %loop_itr = add i32 %loop_cnt3, 1
  store i32 %loop_itr, i32* %loop_cnt
  br label %while

merge:                                            ; preds = %while
  ret void
}

define void @list_slicestr({ i32*, i8** }*, { i32*, i8** }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i8** }*
  store { i32*, i8** }* %0, { i32*, i8** }** %list_ptr_alloc
  %list_ptr_ptr = load { i32*, i8** }*, { i32*, i8** }** %list_ptr_alloc
  %list_ptr_alloc2 = alloca { i32*, i8** }*
  store { i32*, i8** }* %1, { i32*, i8** }** %list_ptr_alloc2
  %list_ptr_ptr2 = load { i32*, i8** }*, { i32*, i8** }** %list_ptr_alloc2
  %idx_alloc = alloca i32
  store i32 %2, i32* %idx_alloc
  %idx_load = load i32, i32* %idx_alloc
  %idx_alloc1 = alloca i32
  store i32 %3, i32* %idx_alloc1
  %idx_load2 = load i32, i32* %idx_alloc1
  %loop_cnt = alloca i32
  store i32 0, i32* %loop_cnt
  %loop_upper_bound = sub i32 %idx_load2, %idx_load
  br label %while

while:                                            ; preds = %while_body, %entry
  %loop_cnt4 = load i32, i32* %loop_cnt
  %loop_cond = icmp sle i32 %loop_cnt4, %loop_upper_bound
  br i1 %loop_cond, label %while_body, label %merge

while_body:                                       ; preds = %while
  %to_idx = load i32, i32* %loop_cnt
  %from_idx = add i32 %to_idx, %idx_load
  %list_get = call i8* @list_getstr({ i32*, i8** }* %list_ptr_ptr, i32 %from_idx)
  call void @list_pushstr({ i32*, i8** }* %list_ptr_ptr2, i8* %list_get)
  %loop_cnt3 = load i32, i32* %loop_cnt
  %loop_itr = add i32 %loop_cnt3, 1
  store i32 %loop_itr, i32* %loop_cnt
  br label %while

merge:                                            ; preds = %while
  ret void
}

define i32 @list_findbool({ i32*, i1* }*, i1) {
entry:
  %list_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %list_ptr_alloc
  %find_val_alloc = alloca i1
  store i1 %1, i1* %find_val_alloc
  %find_val = load i1, i1* %find_val_alloc
  %list_load = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %loop_cnt = alloca i32
  store i32 0, i32* %loop_cnt
  br label %while

while:                                            ; preds = %merge, %entry
  %loop_iter_cnt = load i32, i32* %loop_cnt
  %loop_cond = icmp slt i32 %loop_iter_cnt, %list_size
  br i1 %loop_cond, label %while_body, label %merge1

while_body:                                       ; preds = %while
  %to_idx = load i32, i32* %loop_cnt
  %list_get = call i1 @list_getbool({ i32*, i1* }* %list_load, i32 %to_idx)
  %if_cond = icmp eq i1 %list_get, %find_val
  br i1 %if_cond, label %then, label %else

merge:                                            ; preds = %else
  %loop_idx = load i32, i32* %loop_cnt
  %loop_itr = add i32 %loop_idx, 1
  store i32 %loop_itr, i32* %loop_cnt
  br label %while

then:                                             ; preds = %while_body
  ret i32 %to_idx

else:                                             ; preds = %while_body
  br label %merge

merge1:                                           ; preds = %while
  ret i32 -1
}

define i32 @list_findint({ i32*, i32* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %list_ptr_alloc
  %find_val_alloc = alloca i32
  store i32 %1, i32* %find_val_alloc
  %find_val = load i32, i32* %find_val_alloc
  %list_load = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %loop_cnt = alloca i32
  store i32 0, i32* %loop_cnt
  br label %while

while:                                            ; preds = %merge, %entry
  %loop_iter_cnt = load i32, i32* %loop_cnt
  %loop_cond = icmp slt i32 %loop_iter_cnt, %list_size
  br i1 %loop_cond, label %while_body, label %merge1

while_body:                                       ; preds = %while
  %to_idx = load i32, i32* %loop_cnt
  %list_get = call i32 @list_getint({ i32*, i32* }* %list_load, i32 %to_idx)
  %if_cond = icmp eq i32 %list_get, %find_val
  br i1 %if_cond, label %then, label %else

merge:                                            ; preds = %else
  %loop_idx = load i32, i32* %loop_cnt
  %loop_itr = add i32 %loop_idx, 1
  store i32 %loop_itr, i32* %loop_cnt
  br label %while

then:                                             ; preds = %while_body
  ret i32 %to_idx

else:                                             ; preds = %while_body
  br label %merge

merge1:                                           ; preds = %while
  ret i32 -1
}

define i32 @list_findfloat({ i32*, double* }*, double) {
entry:
  %list_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %list_ptr_alloc
  %find_val_alloc = alloca double
  store double %1, double* %find_val_alloc
  %find_val = load double, double* %find_val_alloc
  %list_load = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %loop_cnt = alloca i32
  store i32 0, i32* %loop_cnt
  br label %while

while:                                            ; preds = %merge, %entry
  %loop_iter_cnt = load i32, i32* %loop_cnt
  %loop_cond = icmp slt i32 %loop_iter_cnt, %list_size
  br i1 %loop_cond, label %while_body, label %merge1

while_body:                                       ; preds = %while
  %to_idx = load i32, i32* %loop_cnt
  %list_get = call double @list_getfloat({ i32*, double* }* %list_load, i32 %to_idx)
  %if_cond = fcmp oeq double %list_get, %find_val
  br i1 %if_cond, label %then, label %else

merge:                                            ; preds = %else
  %loop_idx = load i32, i32* %loop_cnt
  %loop_itr = add i32 %loop_idx, 1
  store i32 %loop_itr, i32* %loop_cnt
  br label %while

then:                                             ; preds = %while_body
  ret i32 %to_idx

else:                                             ; preds = %while_body
  br label %merge

merge1:                                           ; preds = %while
  ret i32 -1
}

define void @list_removebool({ i32*, i1* }*, i1) {
entry:
  %list_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %list_ptr_alloc
  %rem_val_ptr = alloca i1
  store i1 %1, i1* %rem_val_ptr
  %rem_val = load i1, i1* %rem_val_ptr
  %list_load = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %list_find = call i32 @list_findbool({ i32*, i1* }* %list_load, i1 %rem_val)
  %loop_cond = icmp sge i32 %list_find, 0
  br i1 %loop_cond, label %then, label %else

merge:                                            ; preds = %else
  ret void

then:                                             ; preds = %entry
  %loop_cnt_ptr = alloca i32
  %loop_start_idx = add i32 %list_find, 1
  store i32 %loop_start_idx, i32* %loop_cnt_ptr
  br label %while

while:                                            ; preds = %while_body, %then
  %loop_cnt = load i32, i32* %loop_cnt_ptr
  %loop_cond1 = icmp slt i32 %loop_cnt, %list_size
  br i1 %loop_cond1, label %while_body, label %merge2

while_body:                                       ; preds = %while
  %cur_idx = load i32, i32* %loop_cnt_ptr
  %shift_to_idx = sub i32 %cur_idx, 1
  %list_get = call i1 @list_getbool({ i32*, i1* }* %list_load, i32 %cur_idx)
  call void @list_setbool({ i32*, i1* }* %list_load, i32 %shift_to_idx, i1 %list_get)
  %loop_itr = add i32 %cur_idx, 1
  store i32 %loop_itr, i32* %loop_cnt_ptr
  br label %while

merge2:                                           ; preds = %while
  %size_dec = sub i32 %list_size, 1
  store i32 %size_dec, i32* %list_size_ptr
  ret void

else:                                             ; preds = %entry
  br label %merge
}

define void @list_removeint({ i32*, i32* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %list_ptr_alloc
  %rem_val_ptr = alloca i32
  store i32 %1, i32* %rem_val_ptr
  %rem_val = load i32, i32* %rem_val_ptr
  %list_load = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %list_find = call i32 @list_findint({ i32*, i32* }* %list_load, i32 %rem_val)
  %loop_cond = icmp sge i32 %list_find, 0
  br i1 %loop_cond, label %then, label %else

merge:                                            ; preds = %else
  ret void

then:                                             ; preds = %entry
  %loop_cnt_ptr = alloca i32
  %loop_start_idx = add i32 %list_find, 1
  store i32 %loop_start_idx, i32* %loop_cnt_ptr
  br label %while

while:                                            ; preds = %while_body, %then
  %loop_cnt = load i32, i32* %loop_cnt_ptr
  %loop_cond1 = icmp slt i32 %loop_cnt, %list_size
  br i1 %loop_cond1, label %while_body, label %merge2

while_body:                                       ; preds = %while
  %cur_idx = load i32, i32* %loop_cnt_ptr
  %shift_to_idx = sub i32 %cur_idx, 1
  %list_get = call i32 @list_getint({ i32*, i32* }* %list_load, i32 %cur_idx)
  call void @list_setint({ i32*, i32* }* %list_load, i32 %shift_to_idx, i32 %list_get)
  %loop_itr = add i32 %cur_idx, 1
  store i32 %loop_itr, i32* %loop_cnt_ptr
  br label %while

merge2:                                           ; preds = %while
  %size_dec = sub i32 %list_size, 1
  store i32 %size_dec, i32* %list_size_ptr
  ret void

else:                                             ; preds = %entry
  br label %merge
}

define void @list_removefloat({ i32*, double* }*, double) {
entry:
  %list_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %list_ptr_alloc
  %rem_val_ptr = alloca double
  store double %1, double* %rem_val_ptr
  %rem_val = load double, double* %rem_val_ptr
  %list_load = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %list_find = call i32 @list_findfloat({ i32*, double* }* %list_load, double %rem_val)
  %loop_cond = icmp sge i32 %list_find, 0
  br i1 %loop_cond, label %then, label %else

merge:                                            ; preds = %else
  ret void

then:                                             ; preds = %entry
  %loop_cnt_ptr = alloca i32
  %loop_start_idx = add i32 %list_find, 1
  store i32 %loop_start_idx, i32* %loop_cnt_ptr
  br label %while

while:                                            ; preds = %while_body, %then
  %loop_cnt = load i32, i32* %loop_cnt_ptr
  %loop_cond1 = icmp slt i32 %loop_cnt, %list_size
  br i1 %loop_cond1, label %while_body, label %merge2

while_body:                                       ; preds = %while
  %cur_idx = load i32, i32* %loop_cnt_ptr
  %shift_to_idx = sub i32 %cur_idx, 1
  %list_get = call double @list_getfloat({ i32*, double* }* %list_load, i32 %cur_idx)
  call void @list_setfloat({ i32*, double* }* %list_load, i32 %shift_to_idx, double %list_get)
  %loop_itr = add i32 %cur_idx, 1
  store i32 %loop_itr, i32* %loop_cnt_ptr
  br label %while

merge2:                                           ; preds = %while
  %size_dec = sub i32 %list_size, 1
  store i32 %size_dec, i32* %list_size_ptr
  ret void

else:                                             ; preds = %entry
  br label %merge
}

define void @list_insertbool({ i32*, i1* }*, i32, i1) {
entry:
  %list_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %list_ptr_alloc
  %list_load = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc
  %insert_idx_ptr = alloca i32
  store i32 %1, i32* %insert_idx_ptr
  %insert_idx = load i32, i32* %insert_idx_ptr
  %insert_val_ptr = alloca i1
  store i1 %2, i1* %insert_val_ptr
  %insert_val = load i1, i1* %insert_val_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %loop_cnt_ptr = alloca i32
  %last_index = sub i32 %list_size, 1
  store i32 %last_index, i32* %loop_cnt_ptr
  br label %while

while:                                            ; preds = %while_body, %entry
  %loop_cnt = load i32, i32* %loop_cnt_ptr
  %loop_cond = icmp sge i32 %loop_cnt, %insert_idx
  br i1 %loop_cond, label %while_body, label %merge

while_body:                                       ; preds = %while
  %cur_idx = load i32, i32* %loop_cnt_ptr
  %shift_to_idx = add i32 %cur_idx, 1
  %list_get = call i1 @list_getbool({ i32*, i1* }* %list_load, i32 %cur_idx)
  call void @list_setbool({ i32*, i1* }* %list_load, i32 %shift_to_idx, i1 %list_get)
  %loop_itr = sub i32 %cur_idx, 1
  store i32 %loop_itr, i32* %loop_cnt_ptr
  br label %while

merge:                                            ; preds = %while
  call void @list_setbool({ i32*, i1* }* %list_load, i32 %insert_idx, i1 %insert_val)
  %size_inc = add i32 %list_size, 1
  store i32 %size_inc, i32* %list_size_ptr
  ret void
}

define void @list_insertint({ i32*, i32* }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %list_ptr_alloc
  %list_load = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc
  %insert_idx_ptr = alloca i32
  store i32 %1, i32* %insert_idx_ptr
  %insert_idx = load i32, i32* %insert_idx_ptr
  %insert_val_ptr = alloca i32
  store i32 %2, i32* %insert_val_ptr
  %insert_val = load i32, i32* %insert_val_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %loop_cnt_ptr = alloca i32
  %last_index = sub i32 %list_size, 1
  store i32 %last_index, i32* %loop_cnt_ptr
  br label %while

while:                                            ; preds = %while_body, %entry
  %loop_cnt = load i32, i32* %loop_cnt_ptr
  %loop_cond = icmp sge i32 %loop_cnt, %insert_idx
  br i1 %loop_cond, label %while_body, label %merge

while_body:                                       ; preds = %while
  %cur_idx = load i32, i32* %loop_cnt_ptr
  %shift_to_idx = add i32 %cur_idx, 1
  %list_get = call i32 @list_getint({ i32*, i32* }* %list_load, i32 %cur_idx)
  call void @list_setint({ i32*, i32* }* %list_load, i32 %shift_to_idx, i32 %list_get)
  %loop_itr = sub i32 %cur_idx, 1
  store i32 %loop_itr, i32* %loop_cnt_ptr
  br label %while

merge:                                            ; preds = %while
  call void @list_setint({ i32*, i32* }* %list_load, i32 %insert_idx, i32 %insert_val)
  %size_inc = add i32 %list_size, 1
  store i32 %size_inc, i32* %list_size_ptr
  ret void
}

define void @list_insertfloat({ i32*, double* }*, i32, double) {
entry:
  %list_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %list_ptr_alloc
  %list_load = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc
  %insert_idx_ptr = alloca i32
  store i32 %1, i32* %insert_idx_ptr
  %insert_idx = load i32, i32* %insert_idx_ptr
  %insert_val_ptr = alloca double
  store double %2, double* %insert_val_ptr
  %insert_val = load double, double* %insert_val_ptr
  %list_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %loop_cnt_ptr = alloca i32
  %last_index = sub i32 %list_size, 1
  store i32 %last_index, i32* %loop_cnt_ptr
  br label %while

while:                                            ; preds = %while_body, %entry
  %loop_cnt = load i32, i32* %loop_cnt_ptr
  %loop_cond = icmp sge i32 %loop_cnt, %insert_idx
  br i1 %loop_cond, label %while_body, label %merge

while_body:                                       ; preds = %while
  %cur_idx = load i32, i32* %loop_cnt_ptr
  %shift_to_idx = add i32 %cur_idx, 1
  %list_get = call double @list_getfloat({ i32*, double* }* %list_load, i32 %cur_idx)
  call void @list_setfloat({ i32*, double* }* %list_load, i32 %shift_to_idx, double %list_get)
  %loop_itr = sub i32 %cur_idx, 1
  store i32 %loop_itr, i32* %loop_cnt_ptr
  br label %while

merge:                                            ; preds = %while
  call void @list_setfloat({ i32*, double* }* %list_load, i32 %insert_idx, double %insert_val)
  %size_inc = add i32 %list_size, 1
  store i32 %size_inc, i32* %list_size_ptr
  ret void
}

define void @list_reversebool({ i32*, i1* }*) {
entry:
  %list_ptr_alloc = alloca { i32*, i1* }*
  store { i32*, i1* }* %0, { i32*, i1* }** %list_ptr_alloc
  %list_load = load { i32*, i1* }*, { i32*, i1* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %left_idx = alloca i32
  store i32 0, i32* %left_idx
  %right_idx = alloca i32
  %tmp = sub i32 %list_size, 1
  store i32 %tmp, i32* %right_idx
  br label %while

while:                                            ; preds = %while_body, %entry
  %right_idx6 = load i32, i32* %right_idx
  %left_idx7 = load i32, i32* %left_idx
  %while_cond = icmp slt i32 %left_idx7, %right_idx6
  br i1 %while_cond, label %while_body, label %merge

while_body:                                       ; preds = %while
  %left_idx1 = load i32, i32* %left_idx
  %right_idx2 = load i32, i32* %right_idx
  %list_get = call i1 @list_getbool({ i32*, i1* }* %list_load, i32 %left_idx1)
  %list_get3 = call i1 @list_getbool({ i32*, i1* }* %list_load, i32 %right_idx2)
  call void @list_setbool({ i32*, i1* }* %list_load, i32 %left_idx1, i1 %list_get3)
  call void @list_setbool({ i32*, i1* }* %list_load, i32 %right_idx2, i1 %list_get)
  %tmp4 = add i32 %left_idx1, 1
  store i32 %tmp4, i32* %left_idx
  %tmp5 = sub i32 %right_idx2, 1
  store i32 %tmp5, i32* %right_idx
  br label %while

merge:                                            ; preds = %while
  ret void
}

define void @list_reverseint({ i32*, i32* }*) {
entry:
  %list_ptr_alloc = alloca { i32*, i32* }*
  store { i32*, i32* }* %0, { i32*, i32* }** %list_ptr_alloc
  %list_load = load { i32*, i32* }*, { i32*, i32* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %left_idx = alloca i32
  store i32 0, i32* %left_idx
  %right_idx = alloca i32
  %tmp = sub i32 %list_size, 1
  store i32 %tmp, i32* %right_idx
  br label %while

while:                                            ; preds = %while_body, %entry
  %right_idx6 = load i32, i32* %right_idx
  %left_idx7 = load i32, i32* %left_idx
  %while_cond = icmp slt i32 %left_idx7, %right_idx6
  br i1 %while_cond, label %while_body, label %merge

while_body:                                       ; preds = %while
  %left_idx1 = load i32, i32* %left_idx
  %right_idx2 = load i32, i32* %right_idx
  %list_get = call i32 @list_getint({ i32*, i32* }* %list_load, i32 %left_idx1)
  %list_get3 = call i32 @list_getint({ i32*, i32* }* %list_load, i32 %right_idx2)
  call void @list_setint({ i32*, i32* }* %list_load, i32 %left_idx1, i32 %list_get3)
  call void @list_setint({ i32*, i32* }* %list_load, i32 %right_idx2, i32 %list_get)
  %tmp4 = add i32 %left_idx1, 1
  store i32 %tmp4, i32* %left_idx
  %tmp5 = sub i32 %right_idx2, 1
  store i32 %tmp5, i32* %right_idx
  br label %while

merge:                                            ; preds = %while
  ret void
}

define void @list_reversefloat({ i32*, double* }*) {
entry:
  %list_ptr_alloc = alloca { i32*, double* }*
  store { i32*, double* }* %0, { i32*, double* }** %list_ptr_alloc
  %list_load = load { i32*, double* }*, { i32*, double* }** %list_ptr_alloc
  %list_size_ptr_ptr = getelementptr inbounds { i32*, double* }, { i32*, double* }* %list_load, i32 0, i32 0
  %list_size_ptr = load i32*, i32** %list_size_ptr_ptr
  %list_size = load i32, i32* %list_size_ptr
  %left_idx = alloca i32
  store i32 0, i32* %left_idx
  %right_idx = alloca i32
  %tmp = sub i32 %list_size, 1
  store i32 %tmp, i32* %right_idx
  br label %while

while:                                            ; preds = %while_body, %entry
  %right_idx6 = load i32, i32* %right_idx
  %left_idx7 = load i32, i32* %left_idx
  %while_cond = icmp slt i32 %left_idx7, %right_idx6
  br i1 %while_cond, label %while_body, label %merge

while_body:                                       ; preds = %while
  %left_idx1 = load i32, i32* %left_idx
  %right_idx2 = load i32, i32* %right_idx
  %list_get = call double @list_getfloat({ i32*, double* }* %list_load, i32 %left_idx1)
  %list_get3 = call double @list_getfloat({ i32*, double* }* %list_load, i32 %right_idx2)
  call void @list_setfloat({ i32*, double* }* %list_load, i32 %left_idx1, double %list_get3)
  call void @list_setfloat({ i32*, double* }* %list_load, i32 %right_idx2, double %list_get)
  %tmp4 = add i32 %left_idx1, 1
  store i32 %tmp4, i32* %left_idx
  %tmp5 = sub i32 %right_idx2, 1
  store i32 %tmp5, i32* %right_idx
  br label %while

merge:                                            ; preds = %while
  ret void
}

define i32 @main() {
entry:
  call void @foo(i32 40)
  ret i32 0
}

define void @foo(i32 %a) {
entry:
  %a1 = alloca i32
  store i32 %a, i32* %a1
  %a2 = load i32, i32* %a1
  %tmp = add i32 %a2, 3
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.3, i32 0, i32 0), i32 %tmp)
  ret void
}
