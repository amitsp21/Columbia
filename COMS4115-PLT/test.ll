; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.13.0"

%struct.List = type { i32, i32, i32* }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @list_get(%struct.List*, i32) #0 {
  %3 = alloca %struct.List*, align 8
  %4 = alloca i32, align 4
  store %struct.List* %0, %struct.List** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct.List*, %struct.List** %3, align 8
  %6 = getelementptr inbounds %struct.List, %struct.List* %5, i32 0, i32 2
  %7 = load i32*, i32** %6, align 8
  %8 = load i32, i32* %4, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i32, i32* %7, i64 %9
  %11 = load i32, i32* %10, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @list_push(%struct.List*, i32) #0 {
  %3 = alloca %struct.List*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.List* %0, %struct.List** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.List*, %struct.List** %3, align 8
  %7 = getelementptr inbounds %struct.List, %struct.List* %6, i32 0, i32 1
  %8 = load i32, i32* %7, align 4
  store i32 %8, i32* %5, align 4
  %9 = load i32, i32* %4, align 4
  %10 = load %struct.List*, %struct.List** %3, align 8
  %11 = getelementptr inbounds %struct.List, %struct.List* %10, i32 0, i32 2
  %12 = load i32*, i32** %11, align 8
  %13 = load i32, i32* %5, align 4
  %14 = add nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %12, i64 %15
  store i32 %9, i32* %16, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.List, align 8
  %3 = alloca [3 x i32], align 4
  store i32 0, i32* %1, align 4
  %4 = getelementptr inbounds [3 x i32], [3 x i32]* %3, i32 0, i32 0
  %5 = getelementptr inbounds %struct.List, %struct.List* %2, i32 0, i32 2
  store i32* %4, i32** %5, align 8
  call void @list_push(%struct.List* %2, i32 42)
  ret i32 0
}

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
