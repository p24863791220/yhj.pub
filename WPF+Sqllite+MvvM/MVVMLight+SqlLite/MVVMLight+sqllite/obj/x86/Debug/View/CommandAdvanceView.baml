   M S B A M L   `   `   `  ����H  DMVVMLightDemo, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:MVVMLightDemo.ModelMVVMLightDemo.Model  5   	   ;"clr-namespace:MVVMLightDemo.CommonMVVMLightDemo.Common  5   	   c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35qPclr-namespace:System.Windows.Interactivity;assembly=System.Windows.InteractivitySystem.Windows.Interactivity 5   	   +    %MVVMLightDemo.View.CommandAdvanceView   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   3model!clr-namespace:MVVMLightDemo.Model     5   	   5common"clr-namespace:MVVMLightDemo.Common     5   	   f bGalaSoft.MvvmLight.Platform, Version=5.3.0.19032, Culture=neutral, PublicKeyToken=5f873c45e98af8a1+mvvm http://www.galasoft.ch/mvvmlight  5   	   XiPclr-namespace:System.Windows.Interactivity;assembly=System.Windows.Interactivity  5   	     � Title$  CommandAdvanceView��5	   	   $	��800��6$   $	��800��61    � DataContext 5   	   ��    Locator �� Source# [   �� Path$ CommandAdvance�.��5
      �  � 	Resources 5   
   *   $MVVMLightDemo.Common.UserInfoConvert  uic��%   &	         5      6%   5      .+�5   
   �� $
��Auto=�6   .��5      ��  �� Orientation$ Vertical=�6   $	��Top=�60   $
��Left=�6H   .+�5      �� $��
10,20,0,50q�6   .+�5      �� $��传递单个参数��6    $
��Bold"�6.   $��12(�6@   $��0,5,0,5q�6N   6b   ]� 5      -   5         ]�Name$ ArgStr��5       .+�5      �� $
��Left=�6%   $	��240��6;   $ 
Horizontal=�6G   .+�5      �� -   5         ��Name$ 
ArgStrFrom��5   &   $	��100��6:   $��0,0,10,0q�6F   6Z   �� 5      $��传递参数��6%   $	��100��64   $
��Left=�6@   ��6[   �� *PassArgStrCommand+��5   %   ��  �� ElementName$ 
ArgStrFrom��$
 Text�	 �� UpdateSourceTrigger$	 PropertyChanged=�6�   5      �� 5      $��Right=�6%   $	��240��6<   $ 
Horizontal=�6H   .+�5      �� ��6(   �� *
ArgStrTo+
 �� StringFormat$
 接收到参数：{0}��6`   5      5      5      �� 5       $��	10,0,0,50q�6   .+�5!      �� $��传递对象参数��6    $
��Bold"�6.   $��12(�6@   $��0,5,0,5q�6N   6b   ]� 5"      .+�5#      �� $
��Left=�6%   $	��240��6;   .+�5$      �� $��传递多个参数��6H   $��23��6Y   $
��Left=�6e   $	��100��6�   ��6%   �� *PassArgObjCmd+��5%   "   #   MVVMLightDemo.Model.UserParam  5&   &      UserName$ Brand��66      	UserPhone$ 88888888��6G      UserAdd$ 地址��6\      UserSex$	 男��6i   6x   5(      5)      �� 5*      $��Right=�6%   $	��240��6<   $ Vertical=�6H   .+�5+      �� ��6(   �� *ObjParam.UserName+$
 姓名：{0}��6f   �� 5,      ��6(   �� *ObjParam.UserPhone+$
 电话：{0}��6g   �� 5-      ��6(   �� *ObjParam.UserAdd+$
 地址：{0}��6e   �� 5.      ��6(   �� *ObjParam.UserSex+$
 性别：{0}��6e   5/      50      51      �� 54      $��	10,0,0,50q�6   .+�55      �� $��动态参数传递��6    $
��Bold"�6.   $��12(�6@   $��0,5,0,5q�6N   6b   �� 56      $ 
Horizontal=�6!   .+�57      �� $ Vertical=�6%   $��0,0,10,0q�6<   .+�58      �� $ 
Horizontal=�6)   $��0,0,0,5q�6B   .+�59   "   �� $��姓名��6,   $��80��66   6D   �� 5:   "   -   5        $ txtUName��5:   *   $	��200��6<   5;      �� 5<      $ 
Horizontal=�6)   $��0,0,0,5q�6B   .+�5=   "   �� $��电话��6,   $��80��66   6D   �� 5>   "   -   5        $ 	txtUPhone��5>   *   $	��200��6=   5?      �� 5@      $ 
Horizontal=�6)   $��0,0,0,5q�6B   .+�5A   "   �� $��地址��6,   $��80��66   6C   �� 5B   "   -   5        $ txtUAdd��5B   *   $	��200��6;   5C      �� 5D      $ 
Horizontal=�6)   $��0,0,0,5q�6B   .+�5E   "   �� $��性别��6,   $��80��66   6D   �� 5F   "   -   5        $ txtUSex��5F   *   $	��200��6;   5G      5H      �� 5J      .+�5K      �� $��点击传递��6%   ��64   �� *DynamicParamCmd+��5L   "   `� 5M   &    `� 	Converter# [ 63   .1�5N   *   �� $ txtUName��62   $
 Text�6I   �� 5O   *   $ txtUSex��62   $
 Text�6H   �� 5P   *   $ 	txtUPhone��62   $
 Text�6J   �� 5Q   *   $ txtUAdd��62   $
 Text�6H   5R   '   5T      5U      �� 5W      $	��240��6%   $ Vertical=�61   $��10,0,0,0q�6H   .+�5X      �� ��6(   �� *ArgsTo.UserName+$
 姓名：{0}��6d   �� 5Y      ��6(   �� *ArgsTo.UserPhone+$
 电话：{0}��6e   �� 5Z      ��6(   �� *ArgsTo.UserAdd+$
 地址：{0}��6c   �� 5[      ��6(   �� *ArgsTo.UserSex+$
 性别：{0}��6c   5\      5]      5^      �� 5a      $��	10,0,0,50q�6   .+�5b      �� $��传递原事件参数��6    $
��Bold"�6/   $��12(�6A   $��0,5,0,5q�6O   6c   ]� 5c      -   5        $ PassEventArg��5c       .+�5d      �� $
��Left=�6%   $	��240��6;   $ 
Horizontal=�6G   .+�5e      �� 
���  ��$��1q�67   .  (System.Windows.Interactivity.Interaction   Triggers 5f      /  )System.Windows.Interactivity.EventTrigger  5g         	EventName$
 Drop��6)   .  (System.Windows.Interactivity.TriggerBase   Actions. 5h      /  )GalaSoft.MvvmLight.Command.EventToCommand     PassEventArgsToCommand .    Command 6P   �� *DropCommand+5i      ._�5k   "   �� $	��100��6,   $��50��68   $��拖拽上传��6E    �� TextAlignment$ Center=�6Q   $��18(�6h    J� 	AllowDrop . 5m   #   5n      5o      �� 5p      $��Right=�6%   $	��240��6<   $ 
Horizontal=�6H   .+�5q      �� ��6(   �� *	FileAdd+$
 获取地址：{0}��6^   5r      5s      5t      �� 5w      $��	10,0,0,50q�6   .+�5x      �� $��事件转命令执行��6    $
��Bold"�6/   $��12(�6A   $��0,5,0,5q�6O   6c   ]� 5y      -   5        $ EventToCommand��5y       .+�5z      �� $
��Left=�6%   $	��240��6;   $ 
Horizontal=�6G   .+�5{      �� $	��130��6'    �� DisplayMemberPath$
 Text��6X    �� SelectedValuePath$	 Key��6q   ��63   �� *ResType.List+ �� SelectedIndex 5|      �� *ResType.SelectIndex+ 5}   "     5~   &   $ SelectionChanged��65   . 5   *      6>   �� *SelectCommand+5�   '   5�      5�      �� 5�      $��Right=�6%   $	��240��6<   $ 
Horizontal=�6H   .+�5�      �� ��6(   �� *
SelectInfo+$
 选中值：{0}��6`   5�      5�      5�      5�      5�      5�      5�      