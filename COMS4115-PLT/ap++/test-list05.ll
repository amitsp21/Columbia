; ModuleID = 'AP_PlusPlus'
source_filename = "AP_PlusPlus"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

define i1 @list_getbool({ i32, i1* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i1* }*
  store { i32, i1* }* %0, { i32, i1* }** %list_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %list_load = load { i32, i1* }*, { i32, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i1* }, { i32, i1* }* %list_load, i32 0, i32 1
  %array_load = load i1*, i1** %list_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %list_arry_element_ptr = getelementptr i1, i1* %array_load, i32 %idx_load
  %list_array_element_ptr = load i1, i1* %list_arry_element_ptr
  ret i1 %list_array_element_ptr
}

define i32 @list_getint({ i32, i32* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i32* }*
  store { i32, i32* }* %0, { i32, i32* }** %list_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %list_load = load { i32, i32* }*, { i32, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32* }, { i32, i32* }* %list_load, i32 0, i32 1
  %array_load = load i32*, i32** %list_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %list_arry_element_ptr = getelementptr i32, i32* %array_load, i32 %idx_load
  %list_array_element_ptr = load i32, i32* %list_arry_element_ptr
  ret i32 %list_array_element_ptr
}

define double @list_getfloat({ i32, double* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32, double* }*
  store { i32, double* }* %0, { i32, double* }** %list_ptr_alloc
  %idx_alloc = alloca i32
  store i32 %1, i32* %idx_alloc
  %list_load = load { i32, double* }*, { i32, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, double* }, { i32, double* }* %list_load, i32 0, i32 1
  %array_load = load double*, double** %list_array_ptr
  %idx_load = load i32, i32* %idx_alloc
  %list_arry_element_ptr = getelementptr double, double* %array_load, i32 %idx_load
  %list_array_element_ptr = load double, double* %list_arry_element_ptr
  ret double %list_array_element_ptr
}

define void @list_setbool({ i32, i1* }*, i32, i1) {
entry:
  %list_ptr_alloc = alloca { i32, i1* }*
  store { i32, i1* }* %0, { i32, i1* }** %list_ptr_alloc
  %list_load = load { i32, i1* }*, { i32, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i1* }, { i32, i1* }* %list_load, i32 0, i32 1
  %list_array_load = load i1*, i1** %list_array_ptr
  %list_arry_next_element_ptr = getelementptr i1, i1* %list_array_load, i32 %1
  store i1 %2, i1* %list_arry_next_element_ptr
  ret void
}

define void @list_setint({ i32, i32* }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i32* }*
  store { i32, i32* }* %0, { i32, i32* }** %list_ptr_alloc
  %list_load = load { i32, i32* }*, { i32, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32* }, { i32, i32* }* %list_load, i32 0, i32 1
  %list_array_load = load i32*, i32** %list_array_ptr
  %list_arry_next_element_ptr = getelementptr i32, i32* %list_array_load, i32 %1
  store i32 %2, i32* %list_arry_next_element_ptr
  ret void
}

define void @list_setfloat({ i32, double* }*, i32, double) {
entry:
  %list_ptr_alloc = alloca { i32, double* }*
  store { i32, double* }* %0, { i32, double* }** %list_ptr_alloc
  %list_load = load { i32, double* }*, { i32, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, double* }, { i32, double* }* %list_load, i32 0, i32 1
  %list_array_load = load double*, double** %list_array_ptr
  %list_arry_next_element_ptr = getelementptr double, double* %list_array_load, i32 %1
  store double %2, double* %list_arry_next_element_ptr
  ret void
}

define void @list_pushbool({ i32, i1* }*, i1) {
entry:
  %list_ptr_alloc = alloca { i32, i1* }*
  store { i32, i1* }* %0, { i32, i1* }** %list_ptr_alloc
  %val_alloc = alloca i1
  store i1 %1, i1* %val_alloc
  %list_load = load { i32, i1* }*, { i32, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i1* }, { i32, i1* }* %list_load, i32 0, i32 1
  %list_array_load = load i1*, i1** %list_array_ptr
  %list_size = getelementptr inbounds { i32, i1* }, { i32, i1* }* %list_load, i32 0, i32 0
  %list_size1 = load i32, i32* %list_size
  %list_arry_next_element_ptr = getelementptr i1, i1* %list_array_load, i32 %list_size1
  %inc_size = add i32 %list_size1, 1
  store i32 %inc_size, i32* %list_size
  %val = load i1, i1* %val_alloc
  store i1 %val, i1* %list_arry_next_element_ptr
  ret void
}

define void @list_pushint({ i32, i32* }*, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i32* }*
  store { i32, i32* }* %0, { i32, i32* }** %list_ptr_alloc
  %val_alloc = alloca i32
  store i32 %1, i32* %val_alloc
  %list_load = load { i32, i32* }*, { i32, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32* }, { i32, i32* }* %list_load, i32 0, i32 1
  %list_array_load = load i32*, i32** %list_array_ptr
  %list_size = getelementptr inbounds { i32, i32* }, { i32, i32* }* %list_load, i32 0, i32 0
  %list_size1 = load i32, i32* %list_size
  %list_arry_next_element_ptr = getelementptr i32, i32* %list_array_load, i32 %list_size1
  %inc_size = add i32 %list_size1, 1
  store i32 %inc_size, i32* %list_size
  %val = load i32, i32* %val_alloc
  store i32 %val, i32* %list_arry_next_element_ptr
  ret void
}

define void @list_pushfloat({ i32, double* }*, double) {
entry:
  %list_ptr_alloc = alloca { i32, double* }*
  store { i32, double* }* %0, { i32, double* }** %list_ptr_alloc
  %val_alloc = alloca double
  store double %1, double* %val_alloc
  %list_load = load { i32, double* }*, { i32, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, double* }, { i32, double* }* %list_load, i32 0, i32 1
  %list_array_load = load double*, double** %list_array_ptr
  %list_size = getelementptr inbounds { i32, double* }, { i32, double* }* %list_load, i32 0, i32 0
  %list_size1 = load i32, i32* %list_size
  %list_arry_next_element_ptr = getelementptr double, double* %list_array_load, i32 %list_size1
  %inc_size = add i32 %list_size1, 1
  store i32 %inc_size, i32* %list_size
  %val = load double, double* %val_alloc
  store double %val, double* %list_arry_next_element_ptr
  ret void
}

define i1 @list_popbool({ i32, i1* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i1* }*
  store { i32, i1* }* %0, { i32, i1* }** %list_ptr_alloc
  %list_load = load { i32, i1* }*, { i32, i1* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i1* }, { i32, i1* }* %list_load, i32 0, i32 1
  %list_array_load = load i1*, i1** %list_array_ptr
  %list_size_ptr = getelementptr inbounds { i32, i1* }, { i32, i1* }* %list_load, i32 0, i32 0
  %list_size = load i32, i32* %list_size_ptr
  %dec_size = sub i32 %list_size, 1
  %list_arry_next_element_ptr = getelementptr i1, i1* %list_array_load, i32 %dec_size
  %list_arry_next_element = load i1, i1* %list_arry_next_element_ptr
  store i32 %dec_size, i32* %list_size_ptr
  ret i1 %list_arry_next_element
}

define i32 @list_popint({ i32, i32* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i32* }*
  store { i32, i32* }* %0, { i32, i32* }** %list_ptr_alloc
  %list_load = load { i32, i32* }*, { i32, i32* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, i32* }, { i32, i32* }* %list_load, i32 0, i32 1
  %list_array_load = load i32*, i32** %list_array_ptr
  %list_size_ptr = getelementptr inbounds { i32, i32* }, { i32, i32* }* %list_load, i32 0, i32 0
  %list_size = load i32, i32* %list_size_ptr
  %dec_size = sub i32 %list_size, 1
  %list_arry_next_element_ptr = getelementptr i32, i32* %list_array_load, i32 %dec_size
  %list_arry_next_element = load i32, i32* %list_arry_next_element_ptr
  store i32 %dec_size, i32* %list_size_ptr
  ret i32 %list_arry_next_element
}

define double @list_popfloat({ i32, double* }*) {
entry:
  %list_ptr_alloc = alloca { i32, double* }*
  store { i32, double* }* %0, { i32, double* }** %list_ptr_alloc
  %list_load = load { i32, double* }*, { i32, double* }** %list_ptr_alloc
  %list_array_ptr = getelementptr inbounds { i32, double* }, { i32, double* }* %list_load, i32 0, i32 1
  %list_array_load = load double*, double** %list_array_ptr
  %list_size_ptr = getelementptr inbounds { i32, double* }, { i32, double* }* %list_load, i32 0, i32 0
  %list_size = load i32, i32* %list_size_ptr
  %dec_size = sub i32 %list_size, 1
  %list_arry_next_element_ptr = getelementptr double, double* %list_array_load, i32 %dec_size
  %list_arry_next_element = load double, double* %list_arry_next_element_ptr
  store i32 %dec_size, i32* %list_size_ptr
  ret double %list_arry_next_element
}

define i32 @list_sizebool({ i32, i1* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i1* }*
  store { i32, i1* }* %0, { i32, i1* }** %list_ptr_alloc
  %list_load = load { i32, i1* }*, { i32, i1* }** %list_ptr_alloc
  %list_size = getelementptr inbounds { i32, i1* }, { i32, i1* }* %list_load, i32 0, i32 0
  %list_size1 = load i32, i32* %list_size
  ret i32 %list_size1
}

define i32 @list_sizeint({ i32, i32* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i32* }*
  store { i32, i32* }* %0, { i32, i32* }** %list_ptr_alloc
  %list_load = load { i32, i32* }*, { i32, i32* }** %list_ptr_alloc
  %list_size = getelementptr inbounds { i32, i32* }, { i32, i32* }* %list_load, i32 0, i32 0
  %list_size1 = load i32, i32* %list_size
  ret i32 %list_size1
}

define i32 @list_sizefloat({ i32, double* }*) {
entry:
  %list_ptr_alloc = alloca { i32, double* }*
  store { i32, double* }* %0, { i32, double* }** %list_ptr_alloc
  %list_load = load { i32, double* }*, { i32, double* }** %list_ptr_alloc
  %list_size = getelementptr inbounds { i32, double* }, { i32, double* }* %list_load, i32 0, i32 0
  %list_size1 = load i32, i32* %list_size
  ret i32 %list_size1
}

define void @list_slicebool({ i32, i1* }*, { i32, i1* }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i1* }*
  store { i32, i1* }* %0, { i32, i1* }** %list_ptr_alloc
  %list_ptr_ptr = load { i32, i1* }*, { i32, i1* }** %list_ptr_alloc
  %list_ptr_alloc2 = alloca { i32, i1* }*
  store { i32, i1* }* %1, { i32, i1* }** %list_ptr_alloc2
  %list_ptr_ptr2 = load { i32, i1* }*, { i32, i1* }** %list_ptr_alloc2
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
  %list_get = call i1 @list_getbool({ i32, i1* }* %list_ptr_ptr, i32 %from_idx)
  call void @list_setbool({ i32, i1* }* %list_ptr_ptr2, i32 %to_idx, i1 %list_get)
  %loop_cnt3 = load i32, i32* %loop_cnt
  %loop_itr = add i32 %loop_cnt3, 1
  store i32 %loop_itr, i32* %loop_cnt
  br label %while

merge:                                            ; preds = %while
  ret void
}

define void @list_sliceint({ i32, i32* }*, { i32, i32* }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32, i32* }*
  store { i32, i32* }* %0, { i32, i32* }** %list_ptr_alloc
  %list_ptr_ptr = load { i32, i32* }*, { i32, i32* }** %list_ptr_alloc
  %list_ptr_alloc2 = alloca { i32, i32* }*
  store { i32, i32* }* %1, { i32, i32* }** %list_ptr_alloc2
  %list_ptr_ptr2 = load { i32, i32* }*, { i32, i32* }** %list_ptr_alloc2
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
  %list_get = call i32 @list_getint({ i32, i32* }* %list_ptr_ptr, i32 %from_idx)
  call void @list_setint({ i32, i32* }* %list_ptr_ptr2, i32 %to_idx, i32 %list_get)
  %loop_cnt3 = load i32, i32* %loop_cnt
  %loop_itr = add i32 %loop_cnt3, 1
  store i32 %loop_itr, i32* %loop_cnt
  br label %while

merge:                                            ; preds = %while
  ret void
}

define void @list_slicefloat({ i32, double* }*, { i32, double* }*, i32, i32) {
entry:
  %list_ptr_alloc = alloca { i32, double* }*
  store { i32, double* }* %0, { i32, double* }** %list_ptr_alloc
  %list_ptr_ptr = load { i32, double* }*, { i32, double* }** %list_ptr_alloc
  %list_ptr_alloc2 = alloca { i32, double* }*
  store { i32, double* }* %1, { i32, double* }** %list_ptr_alloc2
  %list_ptr_ptr2 = load { i32, double* }*, { i32, double* }** %list_ptr_alloc2
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
  %list_get = call double @list_getfloat({ i32, double* }* %list_ptr_ptr, i32 %from_idx)
  call void @list_setfloat({ i32, double* }* %list_ptr_ptr2, i32 %to_idx, double %list_get)
  %loop_cnt3 = load i32, i32* %loop_cnt
  %loop_itr = add i32 %loop_cnt3, 1
  store i32 %loop_itr, i32* %loop_cnt
  br label %while

merge:                                            ; preds = %while
  ret void
}

define i32 @main() {
entry:
  %a = alloca { i32, i32* }
  %list.size = getelementptr inbounds { i32, i32* }, { i32, i32* }* %a, i32 0, i32 0
  store i32 0, i32* %list.size
  %list.arry = getelementptr inbounds { i32, i32* }, { i32, i32* }* %a, i32 0, i32 1
  %p = alloca i32, i32 1000
  store i32* %p, i32** %list.arry
  %b = alloca { i32, i32* }
  %list.size1 = getelementptr inbounds { i32, i32* }, { i32, i32* }* %b, i32 0, i32 0
  store i32 0, i32* %list.size1
  %list.arry2 = getelementptr inbounds { i32, i32* }, { i32, i32* }* %b, i32 0, i32 1
  %p3 = alloca i32, i32 1000
  store i32* %p3, i32** %list.arry2
  %c = alloca { i32, i32* }
  %list.size4 = getelementptr inbounds { i32, i32* }, { i32, i32* }* %c, i32 0, i32 0
  store i32 0, i32* %list.size4
  %list.arry5 = getelementptr inbounds { i32, i32* }, { i32, i32* }* %c, i32 0, i32 1
  %p6 = alloca i32, i32 1000
  store i32* %p6, i32** %list.arry5
  %i = alloca i32
  %a7 = load { i32, i32* }, { i32, i32* }* %a
  store { i32, i32* } %a7, { i32, i32* }* %c
  store i32 0, i32* %i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i10 = load i32, i32* %i
  %tmp11 = icmp slt i32 %i10, 5
  br i1 %tmp11, label %while_body, label %merge

while_body:                                       ; preds = %while
  %i8 = load i32, i32* %i
  call void @list_pushint({ i32, i32* }* %a, i32 %i8)
  %i9 = load i32, i32* %i
  %tmp = add i32 %i9, 1
  store i32 %tmp, i32* %i
  br label %while

merge:                                            ; preds = %while
  %a12 = load { i32, i32* }, { i32, i32* }* %a
  store { i32, i32* } %a12, { i32, i32* }* %b
  %list_get = call i32 @list_getint({ i32, i32* }* %b, i32 0)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get)
  %list_size = call i32 @list_sizeint({ i32, i32* }* %b)
  %printf13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_size)
  call void @list_pushint({ i32, i32* }* %b, i32 100)
  %list_size14 = call i32 @list_sizeint({ i32, i32* }* %b)
  %printf15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_size14)
  %list_size16 = call i32 @list_sizeint({ i32, i32* }* %b)
  %tmp17 = sub i32 %list_size16, 1
  %list_get18 = call i32 @list_getint({ i32, i32* }* %b, i32 %tmp17)
  %printf19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get18)
  call void @list_pushint({ i32, i32* }* %c, i32 101)
  %list_size20 = call i32 @list_sizeint({ i32, i32* }* %c)
  %printf21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_size20)
  %list_size22 = call i32 @list_sizeint({ i32, i32* }* %c)
  %tmp23 = sub i32 %list_size22, 1
  %list_get24 = call i32 @list_getint({ i32, i32* }* %c, i32 %tmp23)
  %printf25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get24)
  ret i32 0
}
