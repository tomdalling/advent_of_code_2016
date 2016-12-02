require_relative 'vec3'

RSpec.describe Vec3 do
  it 'does vector operations' do
    v1 = Vec3[1,2,3]
    v2 = Vec3[4,5,6]

    expect(v1.to_a).to eq([1,2,3])
    expect(v1 + v2).to eq(Vec3[5,7,9])
    expect(v1 - v2).to eq(Vec3[-3, -3, -3])
    expect(3 * v1).to eq(Vec3[3, 6, 9])
    expect(-v1).to eq(Vec3[-1, -2, -3])
    expect(v1).to eq(Vec3[1,2,3])
    expect(v1.hash).to eq(Vec3[1,2,3].hash)
    expect(v1).not_to eq(v2)
    expect(v1.hash).not_to eq(v2.hash)
  end

  it 'interoperates with arrays a bit' do
    v1 = Vec3[1,2,3]

    expect(v1 + [10, 11]).to eq(Vec3[11,13,3])
    expect(v1 - [10, 11]).to eq(Vec3[-9,-9,3])
  end
end
