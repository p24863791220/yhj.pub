   M S B A M L   `   `   `  ����  MVVMLightDemo"    MVVMLightDemo.View.BindBasic   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  	BindBasic��5   	   $	��500��6   $	��500��6(    � 	Resources 5         BorderBrush��%%   &	        ��5   
   Red��63   5      .��5      � .+�5	   
   ��  �� Orientation$ Vertical=�6   .+�5      �� $ Vertical=�6   $
��Left=�60   .+�5      �� -   5         ��Name$ WelcomeText��5      $	��200��6/   $��	10,10,0,0q�6;   6P   �� 5      $��	10,10,0,0q�6j   ��6   ��  �� ElementName$ WelcomeText�� �� Path$
 Text� �� StringFormat$ 	Hello {0}��6   5      �� 5      $��	10,50,0,0q�6   $ Vertical=�6,   .+�5      �� ��6   ��  �� Source# Z��$ Source�6i   �� 5      ��6   �� # [  ��6Q   �� # [  6�   5      �� 5      $��	10,50,0,0q�6   $ Vertical=�6,    � ToolTip$	 top��6C   .+�5      �� $ 
Horizontal=�6   .+�5      �� $	��150��6    $��获取自身宽度:��6,   6?   �� 5      $	��200��6    ��6,   �� $ Width�	 �� RelativeSource	 �� 
 �� Mode$

 Self=�6u   5      �� 5      $ 
Horizontal=�6   $ parent��66   .+�5       �� $	��150��6    $��查找上一层ToolTip:��6,   6D   �� 5!      ��6    �� $ ToolTip�	 �� $
 FindAncestor=� �� AncestorType" ��6�   5"      �� 5%      $ 
Horizontal=�6   .+�5&      �� $	��150��6    $��查找上二层ToolTip:��6,   6D   �� 5'      ��6    �� $ ToolTip�	 �� $
 FindAncestor=�" �� �� AncestorLevel$ 2��6�   5(      5*      �� 5-      $ Vertical=�6    � DataContext$ UInfo��60   .+�5/      �� $ 
Horizontal=�6   .+�50      �� $��	名称：��6    $	��100��6+   6:   �� 51      $	��100��64   ��6   �� *Name+6C   52      �� 54      $ 
Horizontal=�6   .+�55      �� $��	性别：��6    $	��100��6+   6:   �� 56      $	��100��63   ��6   �� *Sex+6B   57      59      �� 5<      5?      5A      5C      5D      