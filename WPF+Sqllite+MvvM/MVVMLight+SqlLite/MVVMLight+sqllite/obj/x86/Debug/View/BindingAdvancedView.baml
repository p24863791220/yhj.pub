   M S B A M L   `   `   `  ����c  _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35qPclr-namespace:System.Windows.Interactivity;assembly=System.Windows.InteractivitySystem.Windows.Interactivity  5   	   H DMVVMLightDemo, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null=#clr-namespace:MVVMLightDemo.ContentMVVMLightDemo.Content 5   	   ,   &MVVMLightDemo.View.BindingAdvancedView   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   f bGalaSoft.MvvmLight.Platform, Version=5.3.0.19032, Culture=neutral, PublicKeyToken=5f873c45e98af8a1+mvvm http://www.galasoft.ch/mvvmlight  5   	   XiPclr-namespace:System.Windows.Interactivity;assembly=System.Windows.Interactivity  5   	   1Content#clr-namespace:MVVMLightDemo.Content  5   	     � Title$  BindingAdvancedView��5   	    � WindowState$ 	Maximized=�5	   	    � DataContext 5   	   ��    Locator �� Source# [   �� Path$ BindingAdvanced�.��5
      � .+�5   
   �� $
��Auto=�6   .��5   
   ��  �� Orientation$ Vertical=�6   $	��Top=�6,   $
��Left=�6D   .+�5      �� $��
10,20,0,50q�6   .+�5      �� $��	下拉框��6   $
��Bold"�6'   $��12(�69   $��0,5,0,5q�6G   6[   ]� 5      -   5         ]�Name$ Combbox��5      .+�5      �� $
��Left=�6!   $	��240��67   .+�5      �� $	��200��6#   $
��Left=�6/    �� DisplayMemberPath$
 Text��6�    �� SelectedValuePath$	 Key��6�   ��6J   �� *CombboxList+	 �� SelectedItem	 6n   �� *CombboxItem+6�   5      �� 5      $��Right=�6!   $	��240��68   $ 
Horizontal=�6D    6]   �� *CombboxItem+.+�5      �� $��0,0,15,0q�6Q   ��6$   �� *Key+
 �� StringFormat$
 结果：{0}��6f   �� 5      ��6$   �� *Text+6<   5      5      5      �� 5      $��	10,0,0,50q�6   .+�5       �� $��	单选框��6   $
��Bold"�6'   $��12(�69   $��0,5,0,5q�6G   6[   ]� 5!      -   5        $ RadioButton��5!      .+�5"      �� $
��Left=�6!   $	��240��67   .+�5#      	� $��Right=�6o   $	��240��6�   ��6&   �� *SingleRadio+ d� 	IsChecked 6F   �� *IsSingleRadioCheck+5$      5%      �� 5&      $��Right=�6!   $	��240��68   $ 
Horizontal=�6D   .+�5'      �� ��6$   �� *IsSingleRadioCheck+$
 结果：{0}��6c   5(      5)      5*      �� 5,      $��	10,0,0,50q�6   .+�5-      �� $��组合单选框��6   $
��Bold"�6)   $��12(�6;   $��0,5,0,5q�6I   6\   ]� 5.      -   5        $ GroupRadioButton��5.      .+�5/      �� $
��Left=�6!   $	��240��67   .+�50      �� ��6'   �� *RadioButtons+��51      �� 52   "   .R�53   &   	�  	� 	GroupName$ RadioButtons��6l   ��62   �� *	Content+ 6N   �� *	IsCheck+��54   2   �� *DataContext.RadioCheckCommand+ �� RelativeSource ��  �� Mode$ FindAncestor=� �� AncestorType$ ItemsControlL�55   '   56   #   58      59      �� 5;      $��Right=�6!   $	��240��68   $ 
Horizontal=�6D   .+�5<      �� ��6$   �� *RadioButton.Content+$
 结果：{0}��6d   5=      5>      5?      �� 5A      $��	10,0,0,50q�6   .+�5B      �� $��	复合框��6   $
��Bold"�6'   $��12(�69   $��0,5,0,5q�6G   6[   ]� 5C      -   5        $ GroupCheckButton��5C      .+�5D      �� $
��Left=�6!   $	��240��67   .+�5E      �� -   5         ��Name$	 cbt��5E   L   ��6'   �� *CheckButtons+��5F      �� 5G   "   .R�5H   &   �� ��6/   �� *	Content+ 6K   �� *	IsCheck+��5I   2   �� *DataContext.CheckCommand+ �� $ FindAncestor=�$ ItemsControlL�5J   #   5L      5M      �� 5O      $��Right=�6!   $	��240��68   $ 
Horizontal=�6D   .+�5P      �� ��6$   �� *	CheckInfo+$
 结果：{0}��6Z   5Q      5R      5S      �� 5U      $��	10,0,0,50q�6   .+�5V      �� $	��树��6   $
��Bold"�6%   $��12(�67   $��0,5,0,5q�6E   6Y   ]� 5W      -   5        $ 
TreeButton��5W      .+�5X      �� $
��Left=�6!   $	��240��67   .+�5Y      R� -   5         R�Name$
 tree��5Y   H   $��0q�6V   ��6'   �� *
TreeInfo+��5Z      �� 5[   "    �� ItemsSource 6;   �� *
Children+.R�5\   &   �� ��60   �� *
NodeName+5]   #   5_      5`      �� 5b      $��Right=�6!   $	��240��68   $ 
Horizontal=�6D    6]   �� *SelectedItem+ �� ElementName$
 tree��.+�5c      �� $��	结果：��6(   �� 5d      $��0,0,20,0q�6Y   ��6$   �� *NodeID+$
 NodeID：{0}��6Y   �� 5e      ��6$   �� *
NodeName+$
 NodeName：{0}��5f      5g      5h      �� 5j      $��	10,0,0,50q�6   $ Vertical=�6,   .+�5k      �� $��数据列表��6    $
��Bold"�6,   $��12(�6>   $��0,5,0,5q�6L   6`   ]� 5l      .+�5m      �� $
��Left=�6%   .+�5n      &   System.Windows.Controls.DataGrid  -   5          Name$	 dg1��5n   '      AutoGenerateColumns .     CanUserAddRows .     CanUserSortColumns .  $��10q�5o   B    J� 	AllowDrop .    
IsReadOnly . ��5n   4   �� *
UserList+   Columns 5p   "   0  *System.Windows.Controls.DataGridTextColumn  5q   &   ,  &System.Windows.Controls.DataGridColumn   Header$ 学生姓名��69      Width5  /System.Windows.Controls.DataGridLengthConverter$	 100 6d   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6G   �� *
UserName+6d     5r   &   $ 学生家庭地址��69   $	 425 6f    6J   �� *	UserAdd+   ElementStyle 5s   *   �� 5t   .    �� 
TargetType" ��64   .�5u   2   ��   �� Property  � ��! �� Value$
! Wrap=�6Q   �� 5v   2     � ��$
! auto��6K   5w   /   5y   '     5z   &   $ 电话��69   $	 100 6c    6E   �� *	UserPhone+6c     5{   &   $ 性别��69   $	 100 6�    6E   �� *	UserSex+  IntegerToSex" �� 	Converter#" [ 6�   5}      5~      �� 5�      $��Right=�6%   $��15q�6q   $ Vertical=�6}    6<   �� *SelectedItem+$	 dg1��.+�5�      �� ��6(   �� *
UserName+$
 学生姓名：{0}��6_   �� 5�      ��6(   �� *	UserAdd+$
 家庭地址：{0}��6^   �� 5�      ��6(   �� *	UserPhone+$
 电话：{0}��6^   �� 5�      ��6(   �� *	UserSex+#" [ $
 性别：{0}��6�   5�      5�      5�      �� 5�      $��	10,0,0,50q�6   $ Vertical=�6,   .+�5�      �� $��ListBox模板��6   $
��Bold"�6-   $��12(�6?   $��0,5,0,5q�6M   6a   ]� 5�      .+�5�      �� $
��Left=�6%   $
��Left=�6@   .+�5�      �� -	   5        # ��Name$# lb��5�   &   $	��500��6V   $��0q�6b   ��62   �� *ListBoxData+��5�   "   �� 5�   &   .R�5�   *   � ��64   �� *ActualWidth+ �� " ��5�   '   ��5�   "   �� 5�   &   .R�5�   *   �� .+�5�   .   �� $��96��6K   $��96��6V   ��64   �� *Img+6V   �� 5�   .   $��Center=�68   ��6U   �� *Info+5�   +   5�   '   5�      5�      �� 5�      $��Right=�6%   $��15q�6p   $ Vertical=�6|    6<   �� *SelectedItem+$ lb��.+�5�      �� ��6(   �� *Info+$
 选中：{0}��6Y   5�      5�      5�      �� 5�      $��	10,0,0,50q�6   $ Vertical=�60   .+�5�      �� $��用户控件模板列表��6    $
��Bold"�60   $��12(�6B   $��0,5,0,5q�6P   6d   �� 5�      $
��Left=�6!   $	��500��6<   .+�5�      �� $
��Left=�6G   ��6(   �� *FiList+��5�      �� 5�   "   .R�5�   &   )  #MVVMLightDemo.Content.FruitInfoView  5�   #   ��5�      �� 5�   "   .R�5�   &   � $ � Orientation$$ 
Horizontal=�60   5�   '   5�   #   5�      5�      5�      5�      5�      5�      5�      