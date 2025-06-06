; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -passes=instcombine -S | FileCheck %s

define i1 @shl_nuw_eq_0(i8 %x, i8 %C) {
; CHECK-LABEL: @shl_nuw_eq_0(
; CHECK-NEXT:    [[Z:%.*]] = icmp eq i8 [[X:%.*]], 0
; CHECK-NEXT:    ret i1 [[Z]]
;
  %y = shl nuw i8 %x, %C
  %z = icmp eq i8 %y, 0
  ret i1 %z
}

define <2 x i1> @shl_nsw_ne_0(<2 x i8> %x, <2 x i8> %C) {
; CHECK-LABEL: @shl_nsw_ne_0(
; CHECK-NEXT:    [[Z:%.*]] = icmp ne <2 x i8> [[X:%.*]], zeroinitializer
; CHECK-NEXT:    ret <2 x i1> [[Z]]
;
  %y = shl nsw <2 x i8> %x, %C
  %z = icmp ne <2 x i8> %y, zeroinitializer
  ret <2 x i1> %z
}

define i1 @shl_eq_0_fail_missing_flags(i8 %x, i8 %C) {
; CHECK-LABEL: @shl_eq_0_fail_missing_flags(
; CHECK-NEXT:    [[Y:%.*]] = shl i8 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[Z:%.*]] = icmp eq i8 [[Y]], 0
; CHECK-NEXT:    ret i1 [[Z]]
;
  %y = shl i8 %x, %C
  %z = icmp eq i8 %y, 0
  ret i1 %z
}

define i1 @shl_ne_1_fail_nonzero(i8 %x, i8 %C) {
; CHECK-LABEL: @shl_ne_1_fail_nonzero(
; CHECK-NEXT:    [[Y:%.*]] = shl nuw nsw i8 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[Z:%.*]] = icmp ne i8 [[Y]], 1
; CHECK-NEXT:    ret i1 [[Z]]
;
  %y = shl nsw nuw i8 %x, %C
  %z = icmp ne i8 %y, 1
  ret i1 %z
}

define i1 @shl_nsw_slt_1(i8 %x, i8 %C) {
; CHECK-LABEL: @shl_nsw_slt_1(
; CHECK-NEXT:    [[Z:%.*]] = icmp slt i8 [[X:%.*]], 1
; CHECK-NEXT:    ret i1 [[Z]]
;
  %y = shl nsw i8 %x, %C
  %z = icmp slt i8 %y, 1
  ret i1 %z
}

define <2 x i1> @shl_vec_nsw_slt_1_0_todo_non_splat(<2 x i8> %x, <2 x i8> %C) {
; CHECK-LABEL: @shl_vec_nsw_slt_1_0_todo_non_splat(
; CHECK-NEXT:    [[Y:%.*]] = shl nsw <2 x i8> [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[Z:%.*]] = icmp slt <2 x i8> [[Y]], <i8 1, i8 0>
; CHECK-NEXT:    ret <2 x i1> [[Z]]
;
  %y = shl nsw <2 x i8> %x, %C
  %z = icmp slt <2 x i8> %y, <i8 1, i8 0>
  ret <2 x i1> %z
}

define <2 x i1> @shl_nsw_sle_n1(<2 x i8> %x, <2 x i8> %C) {
; CHECK-LABEL: @shl_nsw_sle_n1(
; CHECK-NEXT:    [[Y:%.*]] = shl nsw <2 x i8> [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[Z:%.*]] = icmp slt <2 x i8> [[Y]], splat (i8 2)
; CHECK-NEXT:    ret <2 x i1> [[Z]]
;
  %y = shl nsw <2 x i8> %x, %C
  %z = icmp sle <2 x i8> %y, <i8 1, i8 1>
  ret <2 x i1> %z
}

define <2 x i1> @shl_nsw_sge_1(<2 x i8> %x, <2 x i8> %C) {
; CHECK-LABEL: @shl_nsw_sge_1(
; CHECK-NEXT:    [[Z:%.*]] = icmp sgt <2 x i8> [[X:%.*]], zeroinitializer
; CHECK-NEXT:    ret <2 x i1> [[Z]]
;
  %y = shl nsw <2 x i8> %x, %C
  %z = icmp sge <2 x i8> %y, <i8 1, i8 1>
  ret <2 x i1> %z
}

define i1 @shl_nsw_sgt_n1(i8 %x, i8 %C) {
; CHECK-LABEL: @shl_nsw_sgt_n1(
; CHECK-NEXT:    [[Z:%.*]] = icmp sgt i8 [[X:%.*]], -1
; CHECK-NEXT:    ret i1 [[Z]]
;
  %y = shl nsw i8 %x, %C
  %z = icmp sgt i8 %y, -1
  ret i1 %z
}

define i1 @shl_nuw_sgt_n1_fail_wrong_flag(i8 %x, i8 %C) {
; CHECK-LABEL: @shl_nuw_sgt_n1_fail_wrong_flag(
; CHECK-NEXT:    [[Y:%.*]] = shl nuw i8 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[Z:%.*]] = icmp sgt i8 [[Y]], -1
; CHECK-NEXT:    ret i1 [[Z]]
;
  %y = shl nuw i8 %x, %C
  %z = icmp sgt i8 %y, -1
  ret i1 %z
}

define i1 @shl_nsw_nuw_ult_Csle0(i8 %x, i8 %C) {
; CHECK-LABEL: @shl_nsw_nuw_ult_Csle0(
; CHECK-NEXT:    [[Z:%.*]] = icmp ult i8 [[X:%.*]], -19
; CHECK-NEXT:    ret i1 [[Z]]
;
  %y = shl nuw nsw i8 %x, %C
  %z = icmp ult i8 %y, -19
  ret i1 %z
}

define i1 @shl_nsw_ule_Csle0_fail_missing_flag(i8 %x, i8 %C) {
; CHECK-LABEL: @shl_nsw_ule_Csle0_fail_missing_flag(
; CHECK-NEXT:    [[Y:%.*]] = shl nsw i8 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[Z:%.*]] = icmp ult i8 [[Y]], -18
; CHECK-NEXT:    ret i1 [[Z]]
;
  %y = shl nsw i8 %x, %C
  %z = icmp ule i8 %y, -19
  ret i1 %z
}

define i1 @shl_nsw_nuw_uge_Csle0(i8 %x, i8 %C) {
; CHECK-LABEL: @shl_nsw_nuw_uge_Csle0(
; CHECK-NEXT:    [[Z:%.*]] = icmp ugt i8 [[X:%.*]], -121
; CHECK-NEXT:    ret i1 [[Z]]
;
  %y = shl nuw nsw i8 %x, %C
  %z = icmp uge i8 %y, -120
  ret i1 %z
}

define i1 @shl_nuw_ugt_Csle0_fail_missing_flag(i8 %x, i8 %C) {
; CHECK-LABEL: @shl_nuw_ugt_Csle0_fail_missing_flag(
; CHECK-NEXT:    [[Y:%.*]] = shl nuw i8 [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[Z:%.*]] = icmp ugt i8 [[Y]], -19
; CHECK-NEXT:    ret i1 [[Z]]
;
  %y = shl nuw i8 %x, %C
  %z = icmp ugt i8 %y, -19
  ret i1 %z
}

define <2 x i1> @shl_nsw_nuw_sgt_Csle0(<2 x i8> %x, <2 x i8> %C) {
; CHECK-LABEL: @shl_nsw_nuw_sgt_Csle0(
; CHECK-NEXT:    [[Z:%.*]] = icmp sgt <2 x i8> [[X:%.*]], splat (i8 -10)
; CHECK-NEXT:    ret <2 x i1> [[Z]]
;
  %y = shl nsw nuw <2 x i8> %x, %C
  %z = icmp sgt <2 x i8> %y, <i8 -10, i8 -10>
  ret <2 x i1> %z
}

define <2 x i1> @shl_nsw_nuw_sge_Csle0_todo_non_splat(<2 x i8> %x, <2 x i8> %C) {
; CHECK-LABEL: @shl_nsw_nuw_sge_Csle0_todo_non_splat(
; CHECK-NEXT:    [[Y:%.*]] = shl nuw nsw <2 x i8> [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[Z:%.*]] = icmp sgt <2 x i8> [[Y]], <i8 -11, i8 -66>
; CHECK-NEXT:    ret <2 x i1> [[Z]]
;
  %y = shl nsw nuw <2 x i8> %x, %C
  %z = icmp sge <2 x i8> %y, <i8 -10, i8 -65>
  ret <2 x i1> %z
}

define <2 x i1> @shl_nsw_nuw_sle_Csle0(<2 x i8> %x, <2 x i8> %C) {
; CHECK-LABEL: @shl_nsw_nuw_sle_Csle0(
; CHECK-NEXT:    [[Z:%.*]] = icmp slt <2 x i8> [[X:%.*]], splat (i8 -5)
; CHECK-NEXT:    ret <2 x i1> [[Z]]
;
  %y = shl nsw nuw <2 x i8> %x, %C
  %z = icmp sle <2 x i8> %y, <i8 -6, i8 -6>
  ret <2 x i1> %z
}

define <2 x i1> @shl_nsw_nuw_slt_Csle0_fail_positive(<2 x i8> %x, <2 x i8> %C) {
; CHECK-LABEL: @shl_nsw_nuw_slt_Csle0_fail_positive(
; CHECK-NEXT:    [[Y:%.*]] = shl nuw nsw <2 x i8> [[X:%.*]], [[C:%.*]]
; CHECK-NEXT:    [[Z:%.*]] = icmp slt <2 x i8> [[Y]], splat (i8 6)
; CHECK-NEXT:    ret <2 x i1> [[Z]]
;
  %y = shl nsw nuw <2 x i8> %x, %C
  %z = icmp slt <2 x i8> %y, <i8 6, i8 6>
  ret <2 x i1> %z
}
