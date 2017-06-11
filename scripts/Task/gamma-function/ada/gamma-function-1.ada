function Gamma (X : Long_Float) return Long_Float is
   A : constant array (0..29) of Long_Float :=
       (  1.00000_00000_00000_00000,
          0.57721_56649_01532_86061,
         -0.65587_80715_20253_88108,
         -0.04200_26350_34095_23553,
          0.16653_86113_82291_48950,
         -0.04219_77345_55544_33675,
         -0.00962_19715_27876_97356,
          0.00721_89432_46663_09954,
         -0.00116_51675_91859_06511,
         -0.00021_52416_74114_95097,
          0.00012_80502_82388_11619,
         -0.00002_01348_54780_78824,
         -0.00000_12504_93482_14267,
          0.00000_11330_27231_98170,
         -0.00000_02056_33841_69776,
          0.00000_00061_16095_10448,
          0.00000_00050_02007_64447,
         -0.00000_00011_81274_57049,
          0.00000_00001_04342_67117,
          0.00000_00000_07782_26344,
         -0.00000_00000_03696_80562,
          0.00000_00000_00510_03703,
         -0.00000_00000_00020_58326,
         -0.00000_00000_00005_34812,
          0.00000_00000_00001_22678,
         -0.00000_00000_00000_11813,
          0.00000_00000_00000_00119,
          0.00000_00000_00000_00141,
         -0.00000_00000_00000_00023,
          0.00000_00000_00000_00002
       );
   Y   : constant Long_Float := X - 1.0;
   Sum : Long_Float := A (A'Last);
begin
   for N in reverse A'First..A'Last - 1 loop
      Sum := Sum * Y + A (N);
   end loop;
   return 1.0 / Sum;
end Gamma;
