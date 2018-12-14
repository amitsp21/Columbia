; ModuleID = 'AP_PlusPlus'
source_filename = "AP_PlusPlus"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@strptr = private unnamed_addr constant [11 x i8] c"list size:\00"

declare i32 @printf(i8*, ...)

define i32 @list_get({ i32, i32, i32* }*, i32) {
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

define void @list_push_int32({ i32, i32, i32* }*, i32) {
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

define i32 @list_size_int32({ i32, i32, i32* }*) {
entry:
  %list_ptr_alloc = alloca { i32, i32, i32* }*
  store { i32, i32, i32* }* %0, { i32, i32, i32* }** %list_ptr_alloc
  %list_load = load { i32, i32, i32* }*, { i32, i32, i32* }** %list_ptr_alloc
  %list_size = getelementptr inbounds { i32, i32, i32* }, { i32, i32, i32* }* %list_load, i32 0, i32 1
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
  %a5 = load { i32, i32, i32* }, { i32, i32, i32* }* %a
  store { i32, i32, i32* } %a5, { i32, i32, i32* }* %b
  call void @list_push_int32({ i32, i32, i32* }* %a, i32 101)
  call void @list_push_int32({ i32, i32, i32* }* %a, i32 102)
  call void @list_push_int32({ i32, i32, i32* }* %a, i32 103)
  %list_get = call i32 @list_get({ i32, i32, i32* }* %a, i32 0)
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get)
  %list_get6 = call i32 @list_get({ i32, i32, i32* }* %a, i32 1)
  %printf7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get6)
  %list_get8 = call i32 @list_get({ i32, i32, i32* }* %a, i32 2)
  %printf9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get8)
  %list_get10 = call i32 @list_get({ i32, i32, i32* }* %b, i32 1)
  %printf11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_get10)
  %printf12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @strptr, i32 0, i32 0))
  %list_size = call i32 @list_size_int32({ i32, i32, i32* }* %a)
  %printf13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_size)
  %list_size14 = call i32 @list_size_int32({ i32, i32, i32* }* %b)
  %printf15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i32 %list_size14)
  ret i32 0
}
