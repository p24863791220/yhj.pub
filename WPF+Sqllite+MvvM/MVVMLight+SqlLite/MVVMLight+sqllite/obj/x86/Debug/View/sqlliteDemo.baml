   M S B A M L   `   `   `  ����  MVVMLightDemo$    MVVMLightDemo.View.sqlliteDemo   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  6?   f bGalaSoft.MvvmLight.Platform, Version=5.3.0.19032, Culture=neutral, PublicKeyToken=5f873c45e98af8a1+mvvm http://www.galasoft.ch/mvvmlight  6�     � Title$  sqlliteDemo��5   	   $	��800��6   $
��1000��6*    � DataContext 5   	   ��    Locator �� Source# [   �� Path$ sqlliteUsers�.��5      � .+�5   
   � $
��Left=�6   $	��749��6*   $��	10,10,0,0q�67   $	��Top=�6J   $	��940��6b   .+�5      �� $
��Left=�6   $	��384��66   $��624,17,0,-2q�6C   $	��Top=�6X   $��4��6p    J� RenderTransformOrigin$ 0.5,0.5&�6z   z�5	      V� 5
      .~�5      ��  �� ScaleX$ -1Q�6)   �� 5      �� 5      T� 5      5      5      &   System.Windows.Controls.DataGrid  5      -   5          Name$	 dg1��5         AutoGenerateColumns .     CanUserAddRows .  	   CanUserSortColumns	 .  $��10,75,316,440q�5   B   
 J� 	AllowDrop
 .    
IsReadOnly . ��5   $   �� *List+.  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5         	EventName$ SelectionChanged��6%   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 60   �� *SelectionChangedCommand+   CommandParameter 6\   ��  �� ElementName$	 dg1��5         Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ 用户姓名��6)      Width5  /System.Windows.Controls.DataGridLengthConverter$	 200 6T   1	  +System.Windows.Controls.DataGridBoundColumn 	  Binding 67   �� *
UserName+6T     5      $ 邮箱��6)   $	 280 6T    66   �� *	UserEmail+6T     5      $ 电话��6)   $	 200 6S    65   �� *	UserPhone+6S   5      �� 5      $
��Left=�6   $	��379��64   $��
642,10,0,0q�6A   $	��Top=�6U   $	��120��6m   .+�5       �� -   5         ��Name$ btn_Add��5       $��添加��6+   $��39��68   $
��10,0q�6D   $ 0.499,3.749&�6R   �� 5!      -   5        $ btn_Del��5!      $��删除��6+   $��39��68   $
��10,0q�6D   $ 0.499,3.749&�6R   �� 5"      -   5        $ 	btn_Query��5"      $��查询��6-   $��39��6:   $
��10,0q�6F   $ 0.499,3.749&�6T   5#      �� 5$      $
��Left=�6   $��26��61   $��
123,24,0,0q�6[    �� TextWrapping$
 Wrap=�6o   $	��Top=�6�   $	��153��6�   $ 0.403,0.844&�6�    �� 	MaxLength$ 11��6�    �� MaxLines$ 
2147483646��6�   ��6=   �� *userphoneOne+6�   �� 5%      $��电话��6   $
��Left=�6!   $��26��6<   $��	29,24,0,0q�6H   $	��Top=�6[   $��62��6s   $ -0.762,0.597&�6~   5&      5(      5)      