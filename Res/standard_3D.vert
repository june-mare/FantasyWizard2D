#version 450

/*シェーダへの入力*/
layout(location=0) in vec3 inPosition;
layout(location=1) in vec2 inTexcoord;
layout(location=2) in vec3 inNormal;

/*シェーダからの出力*/
layout(location=0)out vec3 outPosition;
layout(location=1)out vec2 outTexcoord;
layout(location=2)out vec3 outNormal;

/*プログラムからの入力*/
layout(location=0) uniform vec3 translate;
layout(location=1) uniform vec2 sincos;
layout(location=2) uniform vec3 scale;
/*
x:視野角による水平拡大率
y:視野角による⊥拡大率
z:遠近法パラメータA
w:遠近法パラメータB
*/
layout(location=3) uniform vec4 cameraData;
layout(location=4) uniform vec3 cameraPosition;
layout(location=5) uniform vec2 cameraSinCosX;

void main()
{
	/*拡大縮小*/
	vec3 pos = inPosition * scale;

	/*Y軸回転*/
	float s = sincos.x;
	float c = sincos.y;
	outPosition.x = pos.x * c + pos.z * s;
	outPosition.y = pos.y;
	outPosition.z = pos.x * -s + pos.z * c;

	/*平行移動*/
	outPosition += translate;

	/*ワールド法線を計算*/
	outNormal.x = inNormal.x * c + inNormal.z * s;
	outNormal.y = inNormal.y;
	outNormal.z = inNormal.x * -s + inNormal.z * c;

	/*カメラ座標が原点となるように平行移動*/
	pos = outPosition - cameraPosition;

	/*カメラの左右移動がX軸、正面がZ軸となるように回転*/
	s = -cameraSinCosX.x;
	c = cameraSinCosX.y;
	outPosition.x = pos.x;
	outPosition.y = pos.z * -s + pos.y * c;
	outPosition.z = pos.z * c + pos.y * s;

	/*深度値の計算結果が-1～+1になるようなパラメータA,Bを計算*/

	outTexcoord = inTexcoord * vec2(1,-1) + vec2(0,1);
	
	gl_Position.x = outPosition.x * cameraData.x;
	gl_Position.y = outPosition.y * cameraData.y;
	gl_Position.z = -outPosition.z * cameraData.w - cameraData.z;
	gl_Position.w = -outPosition.z;
}