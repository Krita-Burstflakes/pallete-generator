GDPC                 P                                                                         T   res://.godot/exported/133200997/export-96840507efc160317871e03c09b9450a-palette.scn p�      G      R��2�������H    ,   res://.godot/global_script_class_cache.cfg  0�             ��Р�8���8~$}P�    H   res://.godot/imported/circle.png-10953cad44a8947fbdd4128a631e9e52.ctex  0      T      P>�����>(�f v�2    D   res://.godot/imported/icon.png-487276ed1e3a0c39cad0279d744ee560.ctex`$      r      �zH|[d��&�s���    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�9      �H      ��P�1G��;�{</��       res://.godot/uid_cache.bin   �      r       "����iZ&�9n�m�       res://circle.png.import �#      �       4��"�*�
a�k/       res://icon.png.import   �8      �       x4.�7�3cU5R�XC�Q       res://icon.svg  P�      �	      ��"�%��K*       res://icon.svg.import   ��      �       R�r����,o���@��       res://palette.tscn.remap��      d       !���z�L�K���^�       res://project.binary��      �      }	���5=����9�K;        res://scripts/blue scroller.gd          �      6��� 0.-aXX�X��       res://scripts/camera.gd        �      ���D�
� ��Y^        res://scripts/force scroller.gd �      �      D߳��f��C��M�++        res://scripts/green scroller.gd �      �      ��\�!f����h�<�       res://scripts/gv.gd �
      d       �M�g*v)+��b݊I�       res://scripts/mode.gd          �      S&c���d&�9�Zg`       res://scripts/output.gd �      [      lF!C�ְ4�a]�a�        res://scripts/red scroller.gd   @      �      ����RI�w�u/&    extends ColorRect

var mouse = get_global_mouse_position()

func _process(delta):
	# moving
	mouse = get_global_mouse_position()
	if mouse.y > 80 and mouse.y < 120 and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == true:
		if mouse.x < 20:
			global_position = Vector2i(0, 80)
			gv.blue = 0
		elif mouse.x > get_viewport_rect().size.x-20:
			global_position = Vector2i(get_viewport_rect().size.x-40, 80)
			gv.blue = 255
		else:
			global_position = Vector2i(mouse.x-20, 80)
			gv.blue = floor(255*((mouse.x-20)/(get_viewport_rect().size.x-40)))
			
	modulate = Color(gv.red/255*gv.reflect, gv.green/255*gv.reflect, gv.blue/255)
	var bg = $"blue scroller bg"
	bg.global_position = Vector2i(0, 80)
	bg.size = Vector2i(get_viewport_rect().size.x, 40)
�����&�P�}��extends Camera2D
func _physics_process(delta):
	#menubackground.position = Vector2(3, 0)
	#logo.position = Vector2(3, 0)
	#buttons.position = Vector2(3, 240)
	#input.position = Vector2(0, get_viewport_rect().position.y+get_viewport_rect().size.y-48)
	#bg.position = Vector2(0, get_viewport_rect().position.y+get_viewport_rect().size.y-1600)
	position = get_viewport_rect().position+get_viewport_rect().size/2
:��ǋ(extends ColorRect

var mouse = get_global_mouse_position()

func _process(delta):
	# moving
	mouse = get_global_mouse_position()
	if mouse.y > 120 and mouse.y < 160 and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == true:
		if mouse.x < 20:
			global_position = Vector2i(0, 120)
			gv.force = 0
		elif mouse.x > get_viewport_rect().size.x-20:
			global_position = Vector2i(get_viewport_rect().size.x-40, 120)
			gv.force = 200
		else:
			global_position = Vector2i(mouse.x-20, 120)
			gv.force = floor(200*((mouse.x-20)/(get_viewport_rect().size.x-40)))
			
	modulate = Color(gv.force/200, gv.force/200, gv.force/200)
	var bg = $"force scroller bg"
	bg.global_position = Vector2i(0, 120)
	bg.size = Vector2i(get_viewport_rect().size.x, 40)
	
}����extends ColorRect

var mouse = get_global_mouse_position()

func _process(delta):
	# moving
	mouse = get_global_mouse_position()
	if mouse.y > 40 and mouse.y < 80 and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == true:
		if mouse.x < 20:
			global_position = Vector2i(0, 40)
			gv.green = 0
		elif mouse.x > get_viewport_rect().size.x-20:
			global_position = Vector2i(get_viewport_rect().size.x-40, 40)
			gv.green = 255
		else:
			global_position = Vector2i(mouse.x-20, 40)
			gv.green = floor(255*((mouse.x-20)/(get_viewport_rect().size.x-40)))
			
	modulate = Color(gv.red/255*gv.reflect, gv.green/255, gv.blue/255*gv.reflect)
	var bg = $"green scroller bg"
	bg.global_position = Vector2i(0, 40)
	bg.size = Vector2i(get_viewport_rect().size.x, 40)
$iq,{�extends Control
var red = 0
var green = 0
var blue = 0
var force = 0
var mode = 0
var reflect = 0.1
:�P����u��Jextends ColorRect
var click = 0
func _process(delta):
	if get_global_mouse_position().x > global_position.x and get_global_mouse_position().x < global_position.x+size.x and get_global_mouse_position().y > global_position.y and get_global_mouse_position().y < global_position.y+size.y:
		color = Color(0, 0, 0, 120.0/256.0)
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == true:
			if click == 0:
				gv.mode = (gv.mode+1)%3
			click = 1
		else:
			click = 0
	else:
		color = Color(0, 0 , 0, 68.0/256.0)
	global_position = Vector2i(0, get_viewport_rect().size.y-227)
	#write mode
	var label = $"mode"
	if gv.mode == 0:
		label.text = "warm"
	if gv.mode == 1:
		label.text = "cold"
	if gv.mode == 2:
		label.text = "gray"
�
���Vextends Control

func _process(delta):
	var dt = $"darktone"
	var mt = $"midtone"
	var lt = $"lighttone"
	var label = $"/root/palette/utilites/color"
	#color modes
	mt.modulate = Color(gv.red/255, gv.green/255, gv.blue/255)
	if gv.mode == 0:
		dt.modulate = Color(floor(gv.red-(22*gv.force)/100)/255, floor(gv.green-(53*gv.force)/100)/255, floor(gv.blue-(13*gv.force)/100)/255)
		lt.modulate = Color(floor(gv.red+(21*gv.force)/100)/255, floor(gv.green+(29*gv.force)/100)/255, floor(gv.blue+(7*gv.force)/100)/255)
	if gv.mode == 1:
		dt.modulate = Color(floor(gv.red-(27*gv.force)/100)/255, floor(gv.green-(42*gv.force)/100)/255, floor(gv.blue-(30*gv.force)/100)/255)
		lt.modulate = Color(floor(gv.red+(20*gv.force)/100)/255, floor(gv.green+(25*gv.force)/100)/255, floor(gv.blue+(20*gv.force)/100)/255)
	if gv.mode == 2:
		dt.modulate = Color(floor(gv.red-(42*gv.force)/100)/255, floor(gv.green-(42*gv.force)/100)/255, floor(gv.blue-(36*gv.force)/100)/255)
		lt.modulate = Color(floor(gv.red+(24*gv.force)/100)/255, floor(gv.green+(31*gv.force)/100)/255, floor(gv.blue+(28*gv.force)/100)/255)
	
	
	
	#filling
	label.text = " r: " + str(gv.red) + "\n g: " + str(gv.green) + "\n b: " + str(gv.blue) + "\n force: " + str(gv.force)
	global_position = Vector2(get_viewport_rect().size.x/2, (get_viewport_rect().size.y-160)/2+160)
	scale = Vector2((get_viewport_rect().size.y-160)/200, (get_viewport_rect().size.y-160)/200)
	
	dt.position = Vector2(0-get_viewport_rect().size.x/2-(get_viewport_rect().size.y-160)/2, 0)
	lt.global_position = global_position+Vector2(get_viewport_rect().size.x/2-(get_viewport_rect().size.y-160)/2, 0)
��]�extends ColorRect

var mouse = get_global_mouse_position()

func _process(delta):
	# moving
	mouse = get_global_mouse_position()
	if mouse.y > 0 and mouse.y < 40 and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == true:
		if mouse.x < 20:
			global_position = Vector2i(0, 0)
			gv.red = 0
		elif mouse.x > get_viewport_rect().size.x-20:
			global_position = Vector2i(get_viewport_rect().size.x-40, 0)
			gv.red = 255
		else:
			global_position = Vector2i(mouse.x-20, 0)
			gv.red = floor(255*((mouse.x-20)/(get_viewport_rect().size.x-40)))
	modulate = Color(gv.red/255, gv.green/255*gv.reflect, gv.blue/255*gv.reflect)
	var bg = $"red scroller bg"
	bg.global_position = Vector2i(0, 0)
	bg.size = Vector2i(get_viewport_rect().size.x, 40)
��A;�3� GST2   �  �     ����               ��         RIFF  WEBPVP8L  /���0��?��p�"ȶ��}��H�rkۮ����� ��JP?,�Y� �2��iD�!9`��mp)�8��"Ir$Ɇ��zN@��dd��=#���m�x3$gn_��m;&�@	�Q��'P�~� ��ٳ3l���E�ߍ�6��mo\+��$t���O�;��)u�y{�������{��{z۟��;��u�6*�V�v�y�vnV����#ۙ.o�N>?}���e;�<��&�e|≯ �f�A~�!��>�F�E��/�%����y����w��m�ro��[������-��Կ0�3�'m���	 �m�f+�byn������ً���n}+ڧ�z;���;c/l����h6p{�[t=í�z���؋ޢ�y~�`�	��>�(ԃ�S�"���*��:���J=i`����>xP	pPhP`PXPPPHP@P8P0P(P PP�3�e�]
 *�<J��{Q���,��I�W�8��4ʃ�[�,��7�4�Q:u �|8�t'Y>X��@eݎ�S�!臨۲�C
ZE�
���,�1̊n�7M7�Y����w���bK�,��AC��Ls["x�]�{���tDhi�
q �
��"�4�(��M��8�Ip,���� �2��o�����ii��ޣs8�����
,�`�clNG?Bs<���ة�Cs��Bs>z��i�TD8�r���N�3ҏ���L��QS!C��Z-#7�>6�I�W-��>�2t		��#����
:�*��`#����
2+���"����
*�+��`"��� ",���!Ă� �,h�`!̂�@-H�� Ԃ�`
�-(�` ܂����`��p+mn�'-6�\ț���9ɍ+n�ӦkcSL�^��Ce�Z�"�qgMzc֤7fM���zaEM���r�O��7&MƠi�X:��U=�ə�9ӂ1fZ0�L��I��)ӄ1d�6�3�c�ta̘6�ӆ�y�c��aL�F��0�yӵ��N�S���M�Ʃ9��d7�襗A��blzif6��lf��6k�66�#��3�.��K׃�Qmr�z�9MN��J�44�-]O��̎���-G���� �44�$��E-=RK׃�UjijZ�̾j1�$S��Y��ϤM�dnيBn����j�|EK_��C�25y�G������o9�����`��o�M���[`S��V���zJ*;���-ttSS[訧BaG=%����:���-t�S��dǷ 	�,�[�4��- 7�E�ƷCb5����Q�c:�7�S2�F3�1$ȍfcH��ȐX��9��R8٥P)��I4J��#�WB���yR�99ŅHّt��G!%�F�:�+������Yr��H���}JGRi+yJGRy8Z�:�{_��y�f�l�,��h��f�%���*��KS�c�k��2w�L+.����E3�����ʲ�1M}.�� �'f��^q��+ٝ'���\��7�͹@|0�x���ȫ����=���d�ul�Y}�f�⩙�2K�@�x�Y�59�:�'�qӧ�/Ԣ9�*�d7{�5jy�	79�:��kM������p��w���������GL��nW����n��&��4j���즫��q�_����	6�M6�Bנ�cQ�]�f/��q:�<5s)�x��������La�/����x����<��y,��SҐOĝW�υ7��] 8��xbf�Qg���p���"�6��������x��2K 7����A�J����@�M�[���U`�yxZ��F3u<�f�������QgszXYv���B���,����Ou4+�J)�xL!���
k:R�c4��Q9aMG�x�+A�R�:ӀPIӑ:�R�� !MG�x|etBex�	�D���h�Q��v�	�ڂ�<FQR�:$<ꐈ�uH�aY4:�,
[�PO%�-�B�1#���f��9�"G�5>E�pkb����9���)r|[3S������4�-詄N)�h�QO����&�жfU���)�-�Ѳ��z�����=��mMO�mQ?�����%�T~����T�%����h?�\>���Gb��~��$���$3t5�zx�dO����&K?�$O�@e��E=MRCO������L�Q=p�MrCG��h��=���$)�q����h��IT��E7��f�3��L���xhf];S�Rtf/���ŉ�F�݃�L�gk��DV�$ qD#΀���Z<�{"�gD�ገ&��XN(��p�Dΐh�=8[�'�R=8c�gL�������L��1��gP4�����PCJ�w6�]�3)��ΨH�l-~&��P��,X��������x>���P��iqAW� ]�rE � W \ nE��V [Q jE�	�V$ Z� fE�@V4 Y� bE� VD X^Ep�UT WQZE`�Ud V�VEP���"��с��J�1�f�Ta��ʊɕ4Ux4���{��.�\Z!��B�J�B�V>zM�V@.��\\S�G�R���+WW@.>���*�p<8�~��g��)O�x|j��T��O[(���X\�bq��1r�%
�����q��UhE���CM�
}4�iZ{.c^������q)�å�B�DhQ ��J�������(n9�@`���(n���W[%@ܖ�z����h�p�ҕ��v��ܚT�\�������� ��@��f�n�z�6��:���Y߭,��ʨ�(o^D�_�jBm��� ��� ����J�R�f������iL��@�	�&�/���!,"�������	�/�}����	Z�C*X���"����J%x�� k)��F�ȽY�x��zp��=�V�Z`�D�ebhV�V�b+r�/p��K�5E��c4a��@��G�j7�z��@��G��8�g�[��9��M�w	���`��_���>�p��K'k�ŷ�>��֫�]/���@]��&���������x)���k=���/˷QO���nn=믚��z���g"~8�_����i��	 �g���Z��9`z[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cn55mo8spn0b2"
path="res://.godot/imported/circle.png-10953cad44a8947fbdd4128a631e9e52.ctex"
metadata={
"vram_texture": false
}
 ���8AۼR�aGST2   �  �     ����               ��       :  RIFF2  WEBPVP8L%  /���_�4�$5z�$ó��^Q#)�(�B+�x�m$�y�0�S��D4� = "��&�h�Y��ё\���2��M:���5DD@���\G�,$�g��>�Sag�/���ܶ$m�H�q��b0O�[۶�h۶U8d�#��)Ο��*���!�ZK���v��䶑 I�Xh튨�������q$I7H���|��Y��[�fK?�c�X�Ξa���k����2"�Oɍ$I�$��@��}�S?��j�_�Z|����q���k�m$����^��W?��G�}��5g���6��E[��-_G��Uw�K��}��[Wv�uo�����X�	�c�֛}�����s����ތw�Sg���_|x����T�F�T��S-��u��ٴ���jF�A�4�J�A�עkqjN[��ШP]lB��Mc,m�a�ũ}�Y�
���:s�5��O�r�5���M�͓ad�8r�Nk_;Iqq�c(�1��Lf�&/���ɉeĈ�aH�0�\T&�*���ʁ[���`f�Z�����}. 7��M/h�|�d�Z�`�p�kM6X�j�����Z�}���'��:�i�0C62�v"D&$Cg-�c�F���u�v�,�A1=Ⲝ�4�H@L����N�Ba���D!�i4X�8�,Qu� j�K}Vg��3i(>���Wq%��):�rWy%v�WR۞��L
]��ĵ�e��	��$���"�Z�]���WL�HR��q�RV�%d�Yr�4z��γ"4��l*>��Ϊ�3���*6Ê̲"3��l+.�ʺ�2���+&���"2�xl,#��ʢ1�X�,C���"1�8l-c��ڢ0��-����"p�5��o�ϣ*��VQ�ţ*&�~Z�!�_?-�L������a�}���RF���NJ�~�����]�����(���
����E�I�\'�I.��I�eԧ^4TC.�����غ�� ���X�֧y��;)����x<���� �O5rbr�VGr[��w������>�7�1Zro�;ʒSXY���q�T�.�Z�1�q�����8�wO��aO�Y�IF:��z{����-}�ʆ〖�+��ޗ":�m�Q�#�т(���Z�t����?A�Ꝧ�D�;�B���.)è��O�F�]$��:���x�"����¨ٝ�b�u�D��ΜF�N�����Wj��6����kiHܹ=�ש��	`��5⩓vĝ�D�jCe����?B��;�7�v�;�D���֓U#�Ε��Ɇ�N���ʺ�XOfU�%8��R�:=FjӋ�����EU�Y������|ZxQY����N���du}�Gz���(%��Ղw�dd=�P�%��NJ(��'t(�:}��E��.�O����l�Gw�[�P��I�,8�w5�t��㰣tD��M�t��������]�6�wu��E*�����3�R��Q���6��i�E��}th[�i5mhq`�U�acBk���V��Z�Gy-dqX[QLe��qL%��q��a�X�� ȟcf��ڒ�*e��*�8����AF�+i�9B�i�I�0�Ơ�Ƙ��pԉ�&�+�hs���`i�B�-*��z!��q؉#���q��L�h�B��d�6�(�Q�U���*ΓY���<_ܧ��6�Ol>(����7PH�XV\���$-N��L�S�QLH��q��� �ǁ�$Im<1�������E�Pj�>��8RJ/�0>�"�ľ"qqB�Z.�mZ-ʜ����Ǳ$;!SjCdI��oqk�D
���@�V@H,){�(��KjCbI1�=�Y�Y�C��b�D�'<��K�j���$�Ot^tC��'l�p�,�.Ʌ�ع��\a=��K�����IP5��E�����h��<R�h	?�bJ�d��ӉZ\{�h�Y� I��I�'�LX$�j1k�4�܃R�}����%�����P11�qK8a:L',ɩ���8!��&�8���qI&��2eTLx#!҉7Z@��8A.S*�ޢS�	ȧ���U+i�a��H���4,���_����A�P9��؀Z��֤ʅ	�[�6�O՗\	��F%�J:����L��"&�I'0Pf�X�̬����T։�bﴠ��68��Ƀ|��0���'��!5��!�t�V����D�i��:�����*oF��CI���YC�oz�M��8��q�(�T|E���=Sx�8�X�X����g� 迫נi�}»\u�
@gb� ufV��~3O���f�5�L�J=��O�sK�`�*� pY˵�nFZ���\]6������Z�Ń�����D�VW}ͽ�.�Lֵ�>N>�jҒ^Z��}�^ɕ���$�a�Br�̖ˤ������b��Z�4���_&p
��]&p��2d�|ƃq��eY\�����*PԒ�8��r/2_��
������Y­쏂­9����
�b�#�G�D*G�D�(qIyɲ��HJ��N��U�����|�x(H̯)!q'K�x�;Y��wT�r�C"	�����kv�zr���/x�GY���T�r��"�8.����>e��5��"�gyơQ�(��X��Z�J��A=�\O�Kz�����eNb<�ӗ�Z���:U����������k��5��d]7���X�S���(��8թ�0+p�떫O ��BDYO����,�1�z
�.1W���/�s.��K�9n-���s=�|\�s�!?|U��K�(?\�shު�/��}f�β#L���U$��{˙Fx���ءR�x���Et�b���Et�tq��ֵ��ǫ�v�q���p��Љ�en�;5�����xE�6`���u�q�Ћ��-Ss��ʹt��Ԁ�R4b�s���8_�.���&�)�h����[F�LOe!s�z��\�^5d�x�������s�^�5�s�ʟr�2� �W_91�:<���x4�/�2�zt��c(^܆�y<F�kÎ���0A��9p�{���#�32QyRȿ��S�\�5���ј�cP��`TN2i�u\b���Q�,��x̰e�d�Ҝ��~�c�-�"z��p��(��0:���(�w9�C��r.�7��|`H�b�SC����!%�,<�R��[UT~jD�S�"3R�J�"̎/��,A�WOr���s����OF�=x?U�%�3����[��5�vJ~����7�%�.o"���)�L۲��G���d�� �@��ʽ'|?�{/.j�v.�Qݬ���!�˻�������a��S�2��Ӳ�R%��ۋ�
�7��c��F�\��!���$�eL;�.�	j{ͥ9QJU}�	gـ���&@�vz\C���u�,[��f��	N���n�����߽��"��Z�p�w�}��E0�&���?+\S���vc�i�U��ܡ��Y9��p��ݮ���ٹ]��/�f;������C�VӐL���V�0,����T�D,u���;%چb���������_;]�21�M���7[�H��d}y��(�!1�L#eM�P,B��f'�C���&����$?�}`U�s�x��U�iBM����ɛ��ez�1����UMN�w���C)%��s�`���j����|�W7 &�9�[tι�h4w���s5�}��.�S��WV�YL-����=C2��WF�}��śP��Tw�V�7��f�;�oh��dpُ�j�	��!�ʖ��e�MeKh������@H�{���ed�D4\�C4,$��ޡ�*���e�LeK��R 8]����d�\.��`*�E��Ĵw���*��m�@b(�܂Z�-%�h�b1I0��<_�y!�$��K�C����r'�K文u���>'!�N2u^ 8�WY��N�9/�9��,��>�\�#����#���&�#{��,ȗ'W��	2�b�$C[H�.Z:	:����>�C��&.���Pq��rwxYx����*�X`����s̑<0tr��S���|
�N�d2/5��1Θ#���>�. W+=&�X��HG 9q�j��s>K%��F�#�{0��FLKNǛg�>ֹ�d��ƈH���F��MV��<��V��>���>่���^�0<�F"u�hشhU���Tժ��?�*�*8��d�"ժn��[�R��T����(��S�>�n�n���AM	-	7�R�z�m�WZ[M���V����V�t�'��(��O*[O�x�%��)]gUتR���Ia�J���Ժ���C�Z_�}��Ae�.���u��,���U}IX�JU�K�Ѭ�:��I�Zc:��A7=�0%��ZZiJ.T�*i��YT~��Je���`ň�ڥ
�����횎V+�G�U�7dV.ZZm�&���d�ٛ�8;�5�/�:��/Y��b�j
��gW��lJ֯�8��ϖd�-����
��~�hgn#ꆭ��:f�َzaCj���M���T�!�RlL}p��S���B6�=���T��d�A_s�&�?۔��Q�۪�mt�m�a�/G[{��o[��M�����D�e��ۼ�m^��$n�Aކ�!�maC��A$mAEΆ�a�l!G���$l$I�����k,�K���$k4�M����j<�:֚s��s�܀�@�(P3�����A���Q�DiPQ�T�7�_��'Ȏ�'D�
Ѽ"�!�v�?v��3�����C��]�-:SKm���Ǣ#m,}�V�K��#e����,�?+��1T�R�@$�uՌ1�R�H2�̂$1Y���1$)�E�4�hN	bL;�Bj��iat�b6t8a|�b2�Cu��2>B�����93�S6��D�Xe¤谰W>�ߟ��ˀ��oh90���"7��/xc/���/f����PU�b��Z�8-C��!F�����m��ً�lF�������}/"�X��ɆdG"���d?����{�+aX�*|l�/����#v��-E�5��T��8qc��"�w0xL^*}��g�"�QG@:��T֘H�4���:aVj�X�kBSu��&1�0�PͨYX��]x�让�&�T{��z��M-Q�C?��w�ᓛ�ɔ���	oՉ>��x���C������Ů���F�����x���i�n��7�f���GU�]W����׆�ݭ_|����8� ��sQK0�_$�n�G[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cro8syvwg6gtb"
path="res://.godot/imported/icon.png-487276ed1e3a0c39cad0279d744ee560.ctex"
metadata={
"vram_texture": false
}
 �]{@�,4�<V�GST2   5  5     ����               55       �H  RIFF�H  WEBPVP8L�H  /4M-I��6P����0 �#� f�A۶�G���{��
���%��RZF����*��hi��]�S�!m2B�{o�=~�oI�,I�l���UR�����.����OP`��ɍ��B��bw�%7��T���ʔ�X�F�:u�"!%%#����������-%�v��T)S$_�Lߥ��W�y�%���k,��,Sxi gv���_������a�a�3nz�<5�p�PjS%�W�ݕ�h�-��H}�1�|�.���� �-��9Oe����S�?>��k��ƞ�'跢�ah�@�%x��J*x��������R��cx��~o~/�-!���fx���D����J��Vt%�M�'���e�U�g�s��Yy+�V��vV�
Zx��*�,�,.�ߒ��aa�Hg|���WE�c�y+:�<�t�M0�h��I�F��l��"��^#�.4r\a��~-^cn�m���DC�3���F��Ά��vx��2�[��ix+:6����|tx�ٜ>	/�s���x��!����t�>oE�Bh�Mi��Z�m1��ɗ��5V��J	j�$���|k���(B�RX���,�h�z	�	}>��耥
�o�d[�/�3�h�Ӳia͢�k�?�Ru���|��`�B.M��,��%t&�L� V1J]���F9����_���Q撅�>BZ�;�Ɗ��5��7�ՙ��}�P��&�ō�2?�Q�;�,t[+�q�r�0���F��h�/�����m�a'.[�;t�;�
�<�$��;ި��"�$���W�G�x�<w��+�?$�-`x�Q�;�-t[�B����p(��^R�^닍znT�#!^P��D�-7
qG��;��t+�n���ŞS���+��n��C�=��=
�{fe71��SJةhw�������5�-2د�üZ;	Eqjaע�^�GC�M,���.�Y��h��v����/����m��d�s�`��N�GCY���]leh��Kx�QP�i���~F�S܎�bz?G{UîF����:����v6��M���t��j���{��3	�694��9�(���cZ`���F�C��1���`a�C!�(t�Q.s�T��G���C�L�%Q��G�S�U�CG���H3��`�@&=�i��8�1��� ���p0��DO�"ȅ�JX��Xm��`7˃���d�[Ԑ�pـ��&\��CfD�i��P�AvD����CL�;�2$�ĲK��c��4�%�v�;o���1�gȕ�j6�x��	�b _��r����u*!g��F��!�'��j���V1��C��A�Sd�;!u��x��� �h B���!�'㽆$
�C��CnO�|�L�T>�!�'S}�l��f����0fȀ�����C:O8eCVE�E��!�'\��Af�_A�ˤ�g��]�of8��$L	dX�5��g�*�,�,3�p��?�7SdZd���c�ȶ�a�x�ى�ϐq��Є��B�E:�ᐬ���@��s}�C�N���B�F"�ᐤs��!�B*��pHЉ�m: �Q$�pH��X�
�0
�������\�/F������1q)YV.�@F��Y�#�q�c	det�E'4���!3����oJ�r���9���a*�ϐ�F��E�����{���o2�G�Ӹ�fd���o4�݄��5���u5�wH�`]f>2nb�-�l�
��n�X��6��=�̵]��A��N���6�E	�9��6��F˃�8:�!�&Nc!������U��@��ѐ[ �������|�p��q��hH��7%t�X�S|�)��%�ѐO�FɃ��.�0��D�h!��3��f*}��|H�P؄30��o/5�w��9�̡]�����	T\[)!����f��r�=:��̝G��!�\�g�&N9z�-�g�&�2]��q����)[/!����|�5_�}\c40YJ_�~T�mfJS�����l����Rc&IY{%Z{�C��TMP�������B�vsG��F���W��ƳG�PQ�m`Z���P��3r�ƪ���V���i�*�є������8A8r�<�AmD��3�6RCu��ҁi01�*$.�&AT5��63�BȠJ�դ��?��Zј�ͯ~C��sƃ͝���C�D�A���#��P/!�x�?|T3q��w�>����n��ߵ��&�x���;�[1�[]�>A��C�,�c�
���˹w�+�*(�L\b����(�"np�=�:�3x�+��I.TR�2����j)���kg+��)�M��%p
*4��Բ�5�{���������z7���C]E���)�#�
*+:M\b/k/Whm��G���z���}�
�WĽ�X�@�E&��-���ʢ\���1��,Z��ݾZO�
��{W\	Pl�Z?8w�J���8�ӻme�T\�#�ݴ�j.Ҙ�nYRU{7�<t@�E�!��U��Py�eb�fU0�^���nUEa��"j�D}�
�������P�q
ӹG%� �0����*}�P��w{��/��H%�ݜr�j1�3�ݚ��1rY�nL��ź�nK��5��nJ��	5͆�nI�'���N��R�dP�!7�w;j
Tf���݌�N	�Zz��fST��nD� ԧ�nC��T��{7�± 5���-��P��
�݀�(T-�]��P�Zڻ���X��w�k-@�*�w�(X��]�υb�d3p�k>-mD�.y͢���U�^Ө�p#�w�ˏ*���]�ɠvCmF�R���P��]���7���.3k�
�n��\�4CG��k\.���V��.;�P�Q�[����|���ˢsuK�7���bԹ���
�9�w�l1nB=G*Ѻ�:��������Z;���6N��r�-��g������$���䋖b�IԹ�5���h3��af��n���Cm�]PxQ���}љ00�z7���.g�	���Ht>x�P�o��۱��K�����7�j�eQ����\˲Q����N���%N�BZv�׽s%�H�����o��j��ި)92�\���������X��Aw|R�[j�F�s�4��]���p��W�#I�k(��GT�Mpa���4u��s	r�yF�g#�ԙv�.`yS���������QgZұ~�G;�"����V4�v�^Y*�{`ӏn����2I��\���n��?���^ejҫs���
����.U������C<�'ft7�O7��)2���\6���b������Vm]��Bs'�an!g�L�;֬�.���F^���y+V���^��� �בS����U���f(�A���]B(KL�,:��@O�v1�w����s���g�T~3��]b��:��f���ڮ�'B'/}�KL�;���p�PJw�F��[�/�d��5�s��\��o\��(�?{+�cm�Ifh�*��|�յ�����j�v.��CB㏫V_�o݀�5���KTˡɃ�j���'7.���S2�e�j,</���%��S%�����);��(u�6��w"����)���r�RNGC񝨃K����A���'L�H�K�ĝKS[�-��.Q�2��Nt�cejʛ��l�[z�6k�D�;ץ\u����)f1{V]Ий*���&��ň+���̡sQVw�}�u�(Dd5mq�Q��x��b��$ť�+R�T�NQ˭Oѹe��*���\��ߵ�����W�^���OTòs1V����^̉NԖ>ᵬE��»�+!"�hJKǻe%�V#�]�r��d�����u _:�_�s�*+R�:�au�0df�\�����<�-�P3�C+*F��+K�e��x�8�"ơ
{�
@G6�g��"FUW��ܹ �K��.F���J�	[�_��QkH̉\�ԕNu��˕^6$�c.���R@��!�^7���H�FY��c��?�Ƒs"]V���2󚈅W���bDQU��y�R�td���hME���Y��vTs�
�JMl'-j���?�kr��yWT���2�Do+bėXT��-3��x�8�s	��%-��	�����#�1
 -)�1o�o��'��������[f�nZaQ�_��d��B:�Z`��7���=�(t�>UP��0�P[#���:
�u�p��yD,&DdMAis�5��W
3��tb4Yg=Ai�4A-.�\��������K�:KL��D��1���mͱ�T�t��w���J���Y�9EQ��0�P	��P9��a�����NFUM��-�ze�'��VM��9��m�V�z���bB3��U��~����|.&�얹�B�,:L��<��Ť�S[=���Ɗ��Z��s��jL/���h>E)�3N�`��O��h��RҪnkZ��0��dsyN
*	]ZfUa0Ǩ68FF�U�R�eN����i1�ǗXI
n���L3���h���ʪuFX3�S�1
 �#%w[�)km�}@�~�%U[NϾ�gO2L6r���NV��I�l Ӎ:�b$���t�ۚK�����̘��8ZF�
���q�6ǈDP*�[gO,�9.���WG�d�5��Q����b.���k�4@-��#_�Y�RC�G�:���G��1�UC:�m͡x2a�!ty�Kj�� j�y�3��9QE�;N�Г���b4ZSiY��� ^1��'��f����.FF��.��	|��D�!1�9W?`�zyP��
!15���Ӗ��p[��K��!4"��OR>Z��ꥧV"��ļ�`�Ճ֭o����n�ldT�n���.JX���2FzV��^�"�#���Gl񠀠��1$�yǈ,��miy��U+*!A'��V:�rh}g���D&f�����C���_B�7cd�K�h��Z<�u�OLb$r�rPJ�������zƈ��r���uK��&���	���ط�-�aqBaNy��F��Vw����,[Q̦�J����ǰ@q/F������7�ɰD�� F:洼h��E.������'V�*E-��'ੋ��w�@��)$��h���A'�ַ�.X��Zt���kF�Z^�,t�R�q�Y�^2�����8	����(�d���Ճ
V+~�
:������7�mX���/Fd9u�� �����&��OG�(�-��,�N�_E���Q�ە�Z�����zQ�+���-�щ��������
���o,c�q�\t���J�V.�����)������EߠM�Q,z��be�	/�£��WV,��^����#812�^+���ZeN���H�z�hb�[!�02�]�l� ��V_EG
k�i6Y�hV���`��ԠWW)����JeI
�Zk�Nd'�P�.o�xX�8�#��u�r��7Z�����_._M�>8�9�.o)u���n�۔�z�^��Kk�h�;��g�]���"A+��w)k�%�^��d�C�(�p�4.�ň�R�@¢�Uʆ5�2
��M�%�c��&HX�g(8i:I�@Ʋ�Eʖ�5�xm0Xu�(�]�'aeCa^����U �b��Ս�6X;���~�hw��N���5�1���4�D�Q���'�1"�)�C[��p8�8i���@#���=%�p�t	N�C��e�W ��8H�R�5�o
X�؇����PD�<�w��.a-mi��`�:���4��Pp�<}��:��z�SMe��@��:�M�<[�+Cs��٫��ڡ�,HbO���C��;�pb�q�04�]�����G�bD"i�?�RX��d��:�B���]-Z��)	:� �U�7#V=$��<k��B�
�u�� �zX��.O�OX�8�t�����m�C��>�2�YN]:�.��X�(�$_�6�G�HX�h2&��*��i�'��(,����2ܧb lA���Hǽ���vy��6�A�&��@=��Cѓ6!���	�*�m}���F�XH� yk�<z$�I`��_��*)h97<l�	v"4"�d.�t�]��]t�`/�8N�Dn�d����ψ�N����]�����.Fde%���iu�i��J��vy��>�HH�]���B@�Yp�ٔoX$S�
A~�Y�]��81H�<m���m�d:A����ս�!���1�y��ST�b���(���.�Fk*��ix�*`w�?c�䤠�.O@lN(�:��w5���`(lO����bhd�V7`��<^��fl�F���T�C�~�f� �,n�: {Yl�.o��Ўv�9DZ`���� 9��T�=a���_���ͺ7�A:�S�-	:ϙ�Ǉ���F?ت؏�YG����p�U�U�"�?I��L����a�"�i�%Q���0�;Ba��P� ����Zs_P��_�dT�Ğ�>����-Î���qK}y4�vu�,X��DV�$>���M!�	����4Ig�C���X���]B�y���5Ȅ}�l݂d�g��g��[b8�\T$��^n��[]&]�@��x�����w�$B��h!�+"a��0&H����� �/�]B/�)������h����<H&>d<X�[]�-�b�A⻔�%�H`��W��m��;*po�������d�.�{���>�!LлU�oZ�ȸO'Hv��J���F����*HbO�]k�j���?l�?HG�9�/o�����iR��S��q���%_���؆�W-lh$��K���JL�m�[ψ�d.=��qP�밧��.HB7go1)lj�rٕ�h�o�	ö�Ԍ�˛O��vP��;�E\6Ei��,�-�x�������w�./�!�wl������d�u�+�������)H<�r��_� �a{�ɨ�K��f8���x��P�� �WD��Q	;�PлW��Hk�s��=�$� 9���`�����ovfQ'J�om�5�A	�rs�:х�FN�˟��}�V�.o36��������(�"KnD�Ԡ �:`��e���FV�˟�lvܣ���ܖ��v;���:�����_�d�vG��A⻘ڟ��9zGߨ�ۊ�khY6�[����Gi6y^k��@~G<Nл�Ԙ�x�c8���#zArR��P�o����G� I�j��-�aߣ���]Jj�n�UYca�˔��ێMit6�+a�Ccu��R��&�������.�4e4.4���i`��9� �P��h�i�	���G6���Ih���BD-� ��g���zȀ��uyki���X͂oM�1JStf��6� ; �^л�W����+|�4�7�d�[.�mC|��BD� ����/���y��q9�Ab�NeM�� B.0���S$2N6D�r!X[�4JC��'���A���O�gc0veğc2
��i��_�$D��$�Y�g�e6�jƜ����aH	C}r�D~�sX>�}��k�>Js�����]��D�>g0�"W#�OޜH()�e��h�8'"�c�K����Ή����У����Q'�.{юF�Q�='�����,a8 ��$�$y�3ߠK��#>w�
15tI�-��\�	��ZM�>9t"/m�+�f	¡4����Q��$s_���F'2���/��щ�n&�1�)�)�.�Ddw����'�N��2k_��/�L'�9i_����l:Q/���B�j�K��E����}! ��'�N$p5e_�B&tI���M��`D]r�Dsɓ���� i��ȁ�4&��qt�Yu"'9�B�+yu"#o�����@��:_b��@����x�Z'ڌMU�7�El�>�u��d��ux]��D��'*�F����Sz��An��* N�'�Nd�U����VA�Aq	?H<g����%��؉��&)�\�O�d'��$G��2t��K��h������v}��D�d���y\�F�h'{��X��%�N�u<Aq�*j�K��(�&=Q}��LQ�)J�u���N��0�dۉ��N�?M=���%�Nd�Wr��5|�.	w"]s�.A@]2�D���c�W�}r�D˨3S�N����d݉|�'&64ۜ��v'�,/q�
�B��;���i����B��;��ݬ��<< ��"~���R��}gn�۰Se�O!	�+�u���֔���ȇ��Q'rQ���{z��^!uy��2���bt���DI�zB����!�"/�v�#�5���Uȱx�0JAو�g�Iy�.o��dD�I��@�E�Q��o.BK|#!�BfV��K�E�9�a%$Z�6G��r*bM���!.A�Ņ�m�&"��C6�Z�	;Q y"�D�����'rא���;�a�nQv"G�P�@�.	y"C)Y���o��.y"�sI��g����6Ц RϠ�$剦�f �N�
�d���f�����I�'���N@�AX]�D���64sq�d扸�W��]r�D�h����C��<�]�9�\�Kz�h�*H�p=B t����H=@�]�Dze�4[�0X[���xxx�蒣'
�N;@9o�N�#��O�1�B�4=Q_�t1p���<=��o������D=��{9����n�d�RW������P%���ٓ�'�Ԓoh���뉜B����=�z"��FX�� ������mn@�����m�\�~4�'=9{�@�T��������gr�Q%% _�(9�ʹ�0=zA��=���ga�cJO➈+!���cmO�hM�ay�㐚����:��z<�I��W�cH�ѓ�'��#��GSG��H��CY�C�>c�A���%A��a'
���
�>=9|"O-酑-�z��D�
�sZD�d�L|L.llq)Kܣ$p9����mG"��l�f�(�H��"K,�n!�L���Q�2Lm^����j�c%;Y�V�����
(�%��i�?L�V@��Q�8�U�8�L}��hn��-��)�j>�� ��a��-��#��q%�D��dv�!)e�G�LZB��^�,�a�r��O���̤4%��N���UYP�vy�ɒ	yP@���0W�L�O���q� �]�e��8険��L���dR�#dd�
��ױLB_��'/��ذK���#x"dI����W{a6B�B��n�.}�fV"$>�7�d.=�>a'1�i̢$t=���;)(��,���9���a@�qa�7�<�p!����8L����i1��wq��??�GHYn�=��E� !͉Hg�,��ɃR�(3P�5�D+�s�aD �m�R�YN*�,�*�(jSo%�8!��9`�d&-q`n`>�EI�Zޠ�1	��"��c��M�h@�>a�E�4gNJ�M;�09���r��$�DN��扄��XL�L}��ؐրd:Q��0�-�?XF��/X#:�����h5m�`����vy3Ȓ;Im�Zx�Fj��8��8QrQ�*8,1��F���LA�kp�n�&
λ�߀r}�d!;Opգ#r�	x&~�	n{�� ��(���&?��
9�1Aҕ�$x!=��	�$�!G��g�>3�<�)�t9i(�$��_��9��G�T'r�$:@)(�D}���*�T�]AA�(T�뀫��D]�P�Ǐ�U'; �Q�B��j�P�{�N%*ԥ;��{��>��4�;@nV�,T�j4%<@kM���3uZ �#�W�05~��5�7	"t,1Ф=���^ Ojb<�3���,�5��H���<@S�dy��"@'�]��gu]"9I)e����/��%�cԩx�s���V����8���qJ@�CZ��TMJ<�������a(�(>#��6��s�(b�:�QO/@#h��Q���h��P>|>�� ^����O"�B�G&@n���̻.(�X �߮����:@���=�ڠ�>
� �T@�(���eW*�QS��A�x2R�3���TĖ~���ZuE �g�G��Ȅ�C�� *"��e�*UAĕ�-C�� �*�bzĖi�Reu�FϾ��(VR��[F�&
 $bˉ$�_���N�=�9�\�+�'@�9�_��`CĖ��gk
}��3 �� ?@�2 /<)@LĖ�	��U4�f��\�@!� �I��Gp� �#���~�u� ~2״�8�hA��q�"p��`A nEl����#�" sd�a��֒@+��E��#��� ���rk�ieM "d�~�Ԓ��Dπ�;�E�+n��o<f�^�m[���;��*�ʌ/��aXY �l���ĥ. q[���:�X�<4y�aF\�2�[.o:��2t1`a�jˡ@HGe ���h@HUi��y���GB�J� `a�bÑ��o�X�	��I)t��rn��!�����.���FB.W`m�/�n�B����l9��8�����Mp]zJ7[��> ��xn���YP ��輲%a�1!�(gp}��x�1!�+p-`�XڝF_�ؖ`v��c;s��k-l�/tn��qB�kD)����[��(����-�ی?Ho)������/WB��"d\�;�&���W	 .`ˡMF�b�,����c����2T1��e(�#���p7`K�#�ޅX|]�;�1�W)�����AT�?U
 ���]#���׷�dl/$���R�ڈ��G���o�T E��oٶ�x��\� .\_p}�\�o��X 3��7��b{��Ղf�׷l�[,l1�Z �1�ő��ע{� �\�ҋlg�؂O[.��w}�ڍ��QS/�l��b|�WT�_�}�ɶ�K�;�w�-+��z�����-�v�z�����[tn*V��R2���[�m*���U3��t�(���{�jF_p/���-��G�=ȿ�켾%dGQ�xZ4Ps��g�7#�����k�������c��������m���l ��p;�7�Mݠ���-�����F ]u���Ŝ��2B�!2������{�\4��B��[�4l%���]8�l�ˋ������CP� _�rk'����:+��_������1JP���b�F�dRY;�~}ˍ}�80:���̽,u���#,��v�(���s��5����0��$m"V6�� �����c5{��G�SU�]�2eax�[>�l��[�� ��!n� ��#��'��R?������}����~����-�����j���z �����1H[i�e���'�VAh������/t�+�sU*��� �� k/o������N2�������[��:�>���H��|�`v����H��7ԢS�UD��y~��}��s�j(����m�Û����UH���k۶L?Cli��-�v�扉����
{ ���=C=:��%�@O���Yl�#���[��g��k���������Q!��j�m�:s��(�$����~���݆"{ ����£���Pe$E�[�~�.�ÄR$]�rx��w&��}UB���s����ZB+۫[�Qo���/����-1[�{�Xg$��)l�r�l(����(x_���T���nٱO`]����B{ 	��mB��s��@�>����ZN�
�W�l�%,i9�>��~u��e�Ч�i0�J���s�MA����-k���E�-(�G��b|�!켊��ruKw]���2+)��<�%|�>�Ơ�EII�����H��˸QR��W��i����U5�zuK��`�u+*4������W�+���]�b�ekЄ��� ���[�'�SU�q��%yg�5>U��?)��3�rMb����n�d�հ1P�m{q�QV�׹[(��
P��e�
��`V]nu�f��rU���ܫ�2n{yQTXh�вU(�+k��ۺSqQ�,��nk�
�D����:j�Jàm��KK�L����Q����5���cq�-@� C���/��
:�k���^�U�
�6�M;�t�+�H��N,lb"��� ��Q^�&�w$l�P�J:m��������gѱ��ĸX�b?����� ^�`�}�:?���'�O ��.^~��U�@L�G�O�U鴄��;x�X�^���^��|�P�5XO?8�D|���8|���o�U�q��U��z�
�����@�kZK���u�q�w�\���7�5�ˌ1��@g-����8-?��R�(ƻO��8��7�S�=�nb4//|	}�:�q�R��h�o����aO�H���ER�_aIV0������R%���9m5�p����E��N����{b�2uK�䶿úZ�Ɂ�]�~;l%���ҥ儊�A>b/�T-&^u��"���~K�*����ڕ����� o��"ki눴�?Ւl̀��2b�`LU��']D8��Y�5R��/!���kA�5V=�� V��5�ɪ��+������~�5^�>-�'�o����/��|Z�����Um�h����������J���Jf���m0��������ô�w GE����u�Ђ�r��\+_�e�ٶ�@ϊ�A��c����{]_4T`Zn�%��HG���`ۻ@�� �p�[h Ւ���@���zm_1䢖�Ȼ��2sԻ����aK���QQ]P��>r!_.�Zn�����ܤA����	�=j2>��JW���K��H�,Hx�z3�\,t��ߗ�
��z;��]+$���Q��G����_�����TUh5t���z��wϟ��.*44��V
������B����Sf�QJfÿ���Q�z{�ťu�=tS����9�z[Z'L��_�ħrB�a���J�Ĺ�� ��P�a�[#n���b�ZB�n�����r�����VJ(`3��a�]#���-�������wW�a��(̏��b6��q��Bx�{ �Ş2�/&�> '��ѭ�-"|c4��e��x��GD}`0�#�x��c|T�GD="��Y!��w�}����pw0=�V��t�r�~ph���.w7�D[<`E���@˩��xR;��I(_<����`B�@��G���`Rw'�{�pP�m��d�>������1�ax�:X��7��֢A�p̠O��Ł�Qw/�}W4X�}.,�w7���H[3�5��pdq0���xT3��O��AZw;<@^5�m������vx�"�d��`,_��?�Jo��K���5�����A�1me�f���XĖ����\���T�!r���h�G�me���OY<��}.�Y���#������za��i _uυ��|Aw�az�,��,�ҭ#�`0�Y�ҵ*�0�n�'-��?������; _e��E�U�(�����Z��Ȉ��X��ևIOs������(p�-��G��k��n}�LI�y�ŭ5A�SA���®�8�$(�y�=��Q��>�K��� W��OE􊠅�s?w���V��D<Q+�}�� ��e1�X� P�n�P�(�x(�/.w�S��Z��~	��� �����X.��������n}�~W���x��&<s�*����r�g�犫�Z�H�.f<$<=X���zV0]�,��jQ�'��],@/ ��Zp�i��@!Y��v}���	�����r�
 ��e������@aק�H{�����\
�G/��Zs�\<
W���>_�:��ĳ��� 1ղ�m���$$-:u}��,�>Gы�쯖�����u@�� S]ł�C�:� z�C�������ux�i׷�9I��cz<�1�e@C�Ĭ���*��q�{Ȃ�XPF��s�)�^���"��jYl{���6Fm_�dł.֏�E�`g����U��J�[��%@+��/k�j9��G!e	��[�F'�e��$%.��*�o�:��������+����>:U-��� �, ��}!t��e�>���n}#����n�p�?��ھ��e�1����s���t�\�t�R9��`���BQ.:�-������x��Ǒ �u�'��]_f:�M���?�eh�{iW�,��u�掻]_b��dL�!��9Ԝ;�L�������l�W�@i��5���H�8��;�M
f!1��֘>q��}7qd�ʙ?@F4����w�R0�O�����icI��ӧ��3����X�l��Ĩ�����/<f�/�'%��8w�j�x��ї�d�����/���yz.飼%H�@wŐ9�����p����W�D���ƴ�-u�f ��C��'�]_f:�FG0����tQL���Y4�[75qc����E���j����9[�����Y5�����Nj���M٨R�����sű���Te�Vc�+�ʙ��a��*�l 
�w5�l�����Wu���*��y�+��}��p �X�o5<Mh�u}a0�+G�n*������o����#��1��^_|F1�?�c���:�ϙ�S[�]_&�kG���p#p}�!~�v���k���r%� �t}mpd@�D���ۀ�WP�{k�z��4�Ff�ff}_\�P>���~�x19�v}uk�i 7Y)�����w�|(�(0r B����>MC�OחyUA�:��6jcɼ�u���Ƞ���fɏjV(�����j(J7�y�I�����Ei�����AV�	���ȝ��ĺ�v<�\�����N��QH�f8~�3���9�@�Q��a:~��l��c�	�]��U0�d>��i�<�R
�vh��Kͦ�
v��y�N�R(]�t0�P�����Z���H2 l�L���xZ��S�W��H���`��<�����\�JM�~����U�PL��d@6AI��Sq�6~!�Sxހg�و�U���mċc�����~o>�MUJ�f�h"@�ˣ�A�	�l�N�L�C�/���o�2ꄶ|�Ҋ&gx`�7B�>�9��3ڢ��*�������]'��+��C����kcƨ�ڪ����r�Щ��Ҹ���K}(��"�Ax�/�.�t���Bu��V��hsW0Gt2��ӯ����J-jܷ�;:�[�J��{�~n�K�r�Ś���1M󻢄���@����U���Ar �^��c��N�wPu��X��G���ꅿ�n~�*/��%�ȗ���05o�|����ފ��`�Kr�~G��;E]��?�a"g�s@������Q�ʡC����o>w���-^���Nr�Ae2�s_��y��O#�p�;M�/H,���)�����\�>�f�u� �_h�����������4�%�{�l�%��5a��p`i�7c	��l���S^����8kҚ�̀�G�N[�?�>败#烁78��{ћ�s�:�}�����c��������������T�=_$�P��u�.�"�`�������A�@�}$�o�5X�%�D��m�.��~"u7~�uб6��I�<��+��R�q@!�����O���Z�i@Р�[$�]���Y���K"g��O�/��c�	���5���'Q�.��^�4�,����Q���E�� ���6�H�)���AWGQ�,t}t�C��}WB_?��߳D�R�@�A�Hnd߀��3x�UҜO ��N�����+ƣ��mL�RI,���hе����G9�AWK#�
��^
�-{hLtŴ���w�@N=PϢ��Y��&�̂G.�A�M6���]9�Y�pt��G]�P�\=--u��]?�C��ݨgŸS�4�
J�c��ޠk(C�%��AWQ��
e�]G��X�h�:�Jj���ܘA�R>���͝f�]M����F(�YO�*lluA���qh�%UbQ�¨k*�G%�d�AWU"�
o	]W�.g� tee�_1���k�n�J�]]9�)d4pt}ջ��4D��}Wd��"F;�A�X�J]F��U�'YC�s�e�$��ߨ� �⅚��K��҅��Q[�+�E�.��.�����T�X=�wR���.�6�l����kɨ��j�VȨ�Ii,u�Tkި�I�;������;)��n�֕hM�;)�I�n�"��	9�Q�B�hJRޣn�(��n�&��%:�uC4NgQ���Q�Dõ�$*���)꯾ Q�n�m���r�Of�n�#��ukd�O)�ᨛ#S�
���n�|,CĢQ7H"������lB#l�]�*���0�Fi9M���[�䥇f�F�,yh���ܹ��]ꯦ��~�����{d��[&S_K��G�4�z^p؁F�6�\�6(�q";k�ƍ��QJ���}�����Ũ�^���tF�B��Tb��u%p�����
4�6��.�oS2e؝�B��B���i+�r؍��rV\Vx�`����E���[*�Ċ��|4ꦊDR�*�����\LHc1�vV�������u�4����-"4�v�EHJ���c�WZ@�Ew<m��Tj�@k�pw�œP;h7yح	#/��2�nk�Ҳ�s��i�ƞ�5D㌺�bl�-4��F�t�	�������k��uo<m��/�R�j�pw�E摔	�sv����"�	�a3@��V:L90XKY��k�<����D�f��$V�L�0�V��w�|�����uz�f��v���L91���]�a�BF��4���"�$��rc��8�(�`8l~H [h��͐���@��$2�<���?�y"��"�Qd���)�������8��h1�/"�*R��L30p>�!�6kD|�}��S����t�l�6wD&(Os|挎�<��`SRkvH�[Y�㣞�94;�ݛ$Va�S�x������w�hө���e��n2��W��x��`7�zNf��N����T��x���9�)!�7�=�Kd��D�fͭ�*I�|����r#���6�����KA����)�$��4uQ#4��-4��?�rM�_y��!GS�t��LX���9h�\�KW�f}0e��|u��b�GS���IS��!:h�������`�?1�iIPd�@M���Tɉza8GSzy��P8H�`�D��~�%pB���g��,%�e�ᔏ�M������"fNP�"��My9p�0�XOt��?��k�ᔝ�|�	�Z�Sb����V�GS��$P'd1F��M��(j��N�:�q`��|8%��ǗtC
��)iE�|K5��u8%�`�i�3�Q�w0UF��J�ᔿ��-���0f�N-����p���L�i�V;��\̖�Rh�������
�	6N9=�/��B�:��SZ�*ʣ7YEt8��`��B�p��)�����A�%��S���J�9(�w8�����:���p�\ڤ&c����)���$4����0&{�(�8����2��A�m�OL����I��@�P�� �vj����9��`�#\QZ@��!�x*��d�h3���?�S�蠦t�2���*b��_��f���J��;O�hs�:�jc`h����LK螘�c@�%S�<���ک��v��u�����T)�@�7Z�M�93Uˆ�t�5��r:�S2=�e�3�YDtb����F�c�3S�lе�;��>�� ��;��vv(�د������h��%][���3���)��ӳH�f�D뵹D�::�N%��"�ٝ�)�aKO�墱��TQ'Y���D�������G����Z���Nm�d��[v�L�8��S��d�G��IP;�:�So,��r���^�~�v�n@�{A�?�p�:7��aR�wuN�9�S��,�rO���8'w�p��@IZv��}v�7py�S����ntr�$7W�|�]�<���Ne��`H��ǧ.�����|������O/���e�vK�j���f���N�n�n��4��)P�,dyz�d7C3�W���zi�~^�ܗ�Z푶e�Y���Opz��7p��襮�D�����;u��Q�{G��_��`=Ѕ�r~���=Ҩ��G�$du嵪�@��:(�rՠ��)�.�V�/k��WR��I��kU��V��r����}pЕ�j	q�\�ڠ�덡���V�/16�>ou,	ڽc˫���0zvF�B��{G,䊹��g�%D�h��V6�xf� ������%��41R�M�Bwl��"���r4�OTM���h�1����>/!f|ltS����/Wm2�&�ߊ���.�y?H��,7l�
x�W�%��`��.H�:�?���u;p�E!��~�!V�[�Tu��\�1�9
��ߒ�"��X�24�+4��p�J>0��{?#A�BOo-��ui*i����T��=Byq�G�%�r����"Qb]�R�j�W������u	

c.ƚe�hgܓ�B�TO�T�&9^�l�HFr�G�������.}�2�|+l뼻R��O�6ʛ��T�2Y>x�}V
�΁ �����&xX�a�����+�*[��k�=�J�4�d��W�J�Zt�_��>�B�FUJ��훏�x&�M��q��l�~��o�L)ɮ�
�[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://rccitluojlik"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    line_spacing    font 
   font_size    font_color    outline_size    outline_color    shadow_size    shadow_color    shadow_offset    script 	   _bundled       Script    res://scripts/mode.gd ��������   Script    res://scripts/red scroller.gd ��������   Script     res://scripts/green scroller.gd ��������   Script    res://scripts/blue scroller.gd ��������   Script     res://scripts/force scroller.gd ��������   Script    res://scripts/output.gd ��������
   Texture2D    res://circle.png y�1���O      local://LabelSettings_emycr          local://LabelSettings_cwi1u G         local://PackedScene_t81b2 q         LabelSettings          *            LabelSettings                      PackedScene          	         names "   2      palette    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    Control 	   utilites    background    color 
   ColorRect    mode    z_index    offset_top    offset_right    offset_bottom    script    texture_filter    texture_repeat    label_settings    horizontal_alignment    vertical_alignment    Label    anchor_top    auto_translate    localize_numeral_system    text    color background 
   scrollers    red scroller    visibility_layer    red scroller bg    z_as_relative    green scroller    green scroller bg    blue scroller    blue scroller bg    force scroller    force scroller bg    output 	   darktone    scale    texture    offset 	   Sprite2D    fill    offset_left    midtone 
   lighttone    	   variants    +                    �?               r�>���=��D>  �?                 ��C     C    ��C                               �     �B             ladno               �               ���>      B                    �B                        ��L>     �B               C                  
   ��L>��L>         
     ��         H�     ��    ��G     �C    P�G
     �C         �C    ��G      node_count             nodes     �  ��������       ����                                                          ����                                                     	   ����                                       
                       ����                        	      
                          ����                                                                                   
   ����                                                                                                        ����	                                          	         
                        ����                                      ����                                                         ����         !                        
                    "   ����                                                 
          #   ����         !                        
                    $   ����                                                           %   ����         !                        
                    &   ����                                                           '   ����         !                        
                     (   ����                                      -   )   ����         *       +   !   ,   "                 .   ����   /   #      $      %      &              -   0   ����         *       +   !                 .   ����         !         $      '      &              -   1   ����          *       +   !   ,   (                 .   ����   /   )      $      *      &             conn_count              conns               node_paths              editable_instances              version             RSRC���'ga��[remap]

path="res://.godot/exported/133200997/export-96840507efc160317871e03c09b9450a-palette.scn"
����D�I>M��list=Array[Dictionary]([])
&+83\<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN"
 "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
<svg version="1.0" xmlns="http://www.w3.org/2000/svg"
 width="1000.000000pt" height="1000.000000pt" viewBox="0 0 1000.000000 1000.000000"
 preserveAspectRatio="xMidYMid meet">

<g transform="translate(0.000000,1000.000000) scale(0.100000,-0.100000)"
fill="#000000" stroke="none">
<path d="M4590 9989 c-396 -33 -868 -134 -1215 -258 -296 -105 -639 -261 -875
-396 -666 -382 -1254 -938 -1682 -1592 -135 -206 -180 -285 -305 -538 -202
-410 -321 -755 -412 -1196 -80 -388 -101 -598 -101 -1009 0 -411 23 -634 101
-1010 69 -329 126 -517 258 -855 54 -139 226 -495 306 -635 327 -570 795
-1098 1328 -1499 419 -314 845 -540 1382 -732 245 -88 646 -186 915 -225 296
-42 814 -58 1105 -34 306 26 701 97 975 176 840 244 1590 690 2201 1311 390
396 723 873 951 1365 180 388 290 714 373 1108 81 379 105 619 105 1030 0 410
-23 634 -101 1010 -87 414 -192 730 -377 1128 -333 718 -859 1364 -1514 1860
-121 92 -382 265 -508 337 -317 181 -757 368 -1116 475 -138 40 -562 131 -699
150 -280 38 -825 52 -1095 29z m-2610 -1639 c77 -16 156 -30 175 -30 35 0 42
-5 350 -270 115 -99 280 -239 371 -316 39 -32 131 -111 205 -174 140 -121 250
-215 429 -365 59 -49 167 -142 241 -206 74 -63 166 -142 205 -175 39 -32 131
-111 205 -174 138 -119 242 -208 429 -365 59 -49 170 -144 246 -210 159 -137
293 -251 404 -345 42 -36 132 -112 200 -170 68 -58 170 -144 228 -193 248
-208 265 -227 482 -561 19 -30 98 -147 175 -261 77 -113 156 -231 175 -260 19
-30 92 -139 162 -242 l127 -188 -67 -67 c-53 -54 -69 -65 -79 -55 -6 6 -79
109 -162 227 -178 255 -181 259 -231 330 -22 30 -49 69 -60 85 -11 17 -38 55
-60 85 -21 30 -48 69 -60 85 -11 17 -36 53 -56 80 -196 281 -254 367 -254 383
0 12 -36 50 -92 98 -50 44 -115 99 -144 124 -108 94 -300 257 -374 320 -86 72
-320 274 -419 359 -35 31 -98 85 -141 121 -71 60 -236 201 -455 390 -49 43
-142 121 -205 175 -153 129 -294 251 -350 300 -49 44 -204 177 -316 271 -109
91 -511 437 -599 514 -28 25 -120 104 -205 175 -85 72 -181 154 -214 184 -110
97 -107 96 -291 130 -93 17 -173 35 -177 39 -4 4 -15 37 -25 74 -17 64 -17 67
1 87 26 28 58 27 226 -9z m5218 -4868 c98 -48 190 -140 233 -228 30 -64 32
-73 40 -253 15 -355 23 -410 75 -526 17 -40 50 -84 101 -137 42 -43 82 -78 88
-78 7 0 20 -10 31 -21 10 -12 41 -37 68 -55 50 -34 50 -36 -5 -48 -39 -8 -260
27 -403 64 -501 131 -808 426 -872 838 -5 32 -3 42 7 42 8 0 119 105 248 234
l234 234 41 -14 c22 -8 74 -31 114 -52z"/>
</g>
</svg>
�?���   y�1���O   res://circle.pngwI[<��9S   res://icon.pngv�p�.�c   res://palette.tscn.44�I�   res://icon.svgO=vV�.��Q���ECFG      application/config/name         palette    application/run/main_scene         res://palette.tscn     application/config/features(   "         4.1    GL Compatibility       application/config/icon         res://icon.svg     autoload/gv         *res://scripts/gv.gd#   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility�:.8�&+~W�