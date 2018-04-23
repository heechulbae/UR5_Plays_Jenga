rosinit
tftree = rostf;
pause(1);

cam_to_marker = getTransform(tftree, 'camera', 'ar_marker_0');
base_to_marker = getTransform(tftree, 'base_link', 'tool_ar_tag');

translation = cam_to_marker.Transform.Translation;
t_cam = [translation.X; translation.Y; translation.Z];
rotation = cam_to_marker.Transform.Rotation;
q_cam = [rotation.W, rotation.X, rotation.Y, rotation.Z];
rot_cam = quat2rotm(q_cam);
tf_cam = [rot_cam t_cam; 0 0 0 1;];

translation = base_to_marker.Transform.Translation;
t_base = [translation.X; translation.Y; translation.Z];
rotation = base_to_marker.Transform.Rotation;
q_base = [rotation.W, rotation.X, rotation.Y, rotation.Z];
rot_base = quat2rotm(q_base);
tf_base = [rot_base t_base; 0 0 0 1;];