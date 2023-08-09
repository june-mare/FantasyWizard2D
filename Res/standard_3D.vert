#version 450

/*�V�F�[�_�ւ̓���*/
layout(location=0) in vec3 inPosition;
layout(location=1) in vec2 inTexcoord;
layout(location=2) in vec3 inNormal;

/*�V�F�[�_����̏o��*/
layout(location=0)out vec3 outPosition;
layout(location=1)out vec2 outTexcoord;
layout(location=2)out vec3 outNormal;

/*�v���O��������̓���*/
layout(location=0) uniform vec3 translate;
layout(location=1) uniform vec2 sincos;
layout(location=2) uniform vec3 scale;
/*
x:����p�ɂ�鐅���g�嗦
y:����p�ɂ��ۊg�嗦
z:���ߖ@�p�����[�^A
w:���ߖ@�p�����[�^B
*/
layout(location=3) uniform vec4 cameraData;
layout(location=4) uniform vec3 cameraPosition;
layout(location=5) uniform vec2 cameraSinCosX;

void main()
{
	/*�g��k��*/
	vec3 pos = inPosition * scale;

	/*Y����]*/
	float s = sincos.x;
	float c = sincos.y;
	outPosition.x = pos.x * c + pos.z * s;
	outPosition.y = pos.y;
	outPosition.z = pos.x * -s + pos.z * c;

	/*���s�ړ�*/
	outPosition += translate;

	/*���[���h�@�����v�Z*/
	outNormal.x = inNormal.x * c + inNormal.z * s;
	outNormal.y = inNormal.y;
	outNormal.z = inNormal.x * -s + inNormal.z * c;

	/*�J�������W�����_�ƂȂ�悤�ɕ��s�ړ�*/
	pos = outPosition - cameraPosition;

	/*�J�����̍��E�ړ���X���A���ʂ�Z���ƂȂ�悤�ɉ�]*/
	s = -cameraSinCosX.x;
	c = cameraSinCosX.y;
	outPosition.x = pos.x;
	outPosition.y = pos.z * -s + pos.y * c;
	outPosition.z = pos.z * c + pos.y * s;

	/*�[�x�l�̌v�Z���ʂ�-1�`+1�ɂȂ�悤�ȃp�����[�^A,B���v�Z*/

	outTexcoord = inTexcoord * vec2(1,-1) + vec2(0,1);
	
	gl_Position.x = outPosition.x * cameraData.x;
	gl_Position.y = outPosition.y * cameraData.y;
	gl_Position.z = -outPosition.z * cameraData.w - cameraData.z;
	gl_Position.w = -outPosition.z;
}