#version 450

/*�V�F�[�_�ւ̓���*/
layout(location=0) in vec3 inPosition;
layout(location=1) in vec2 inTexcoord;
layout(location=2) in vec3 inNormal;

/*�e�N�X�`��*/
layout(binding=0) uniform sampler2D texColor;

/*�o�͂���F�f�[�^*/
out vec4 outColor;

/*���s�����p�����[�^*/
struct DirectionalLight
{
	vec3 color;		//���C�g�̖��邳
	vec3 direction;	//���C�g�̌���
};

layout(location=100)uniform DirectionalLight directionLight;

void main()
{
	outColor = texture(texColor,inTexcoord);

	float invPi = 1 / acos(-1);//�΂̋t��
	/*���`�⊮�ɂ���Ē������P�ł͂Ȃ��Ȃ��Ă���̂ŁA���K�����Ē������P�ɂ���*/
	vec3 normal = normalize(inNormal);

	//�����x���g�̐��������g���Ė��邳���v�Z
	float theta = max(dot(-directionLight.direction,normal),0);

	//�g�U���̖��邳���v�Z
	vec3 diffuse = directionLight.color * theta * invPi;

	//�g�U���̉e���𔽉f
	outColor.rgb *= diffuse;
}