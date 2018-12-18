; ModuleID = 'AP_PlusPlus'
source_filename = "AP_PlusPlus"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

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

define i32 @main() {
entry:
  %a = alloca { i32*, i32* }
  %list_size_ptr = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %a, i32 0, i32 0
  %list_size = alloca i32
  store i32 0, i32* %list_size
  store i32* %list_size, i32** %list_size_ptr
  %list.arry = getelementptr inbounds { i32*, i32* }, { i32*, i32* }* %a, i32 0, i32 1
  %p = alloca i32, i32 1000
  store i32* %p, i32** %list.arry
  %b = alloca { i32*, double* }
  %list_size_ptr1 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %b, i32 0, i32 0
  %list_size2 = alloca i32
  store i32 0, i32* %list_size2
  store i32* %list_size2, i32** %list_size_ptr1
  %list.arry3 = getelementptr inbounds { i32*, double* }, { i32*, double* }* %b, i32 0, i32 1
  %p4 = alloca double, i32 1000
  store double* %p4, double** %list.arry3
  %c = alloca { i32*, i1* }
  %list_size_ptr5 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %c, i32 0, i32 0
  %list_size6 = alloca i32
  store i32 0, i32* %list_size6
  store i32* %list_size6, i32** %list_size_ptr5
  %list.arry7 = getelementptr inbounds { i32*, i1* }, { i32*, i1* }* %c, i32 0, i32 1
  %p8 = alloca i1, i32 1000
  store i1* %p8, i1** %list.arry7
  call void @list_pushint({ i32*, i32* }* %a, i32 1)
  call void @list_pushfloat({ i32*, double* }* %b, double 3.140000e+00)
  call void @list_pushbool({ i32*, i1* }* %c, i1 false)
  %list_get = call i32 @list_getint({ i32*, i32* }* %a, i32 0)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get)
  %list_get9 = call double @list_getfloat({ i32*, double* }* %b, i32 0)
  %printf10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), double %list_get9)
  %list_get11 = call i1 @list_getbool({ i32*, i1* }* %c, i32 0)
  %printf12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i1 %list_get11)
  ret i32 0
}
