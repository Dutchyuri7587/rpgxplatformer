getminigamecontrols();

stages = 5;
currentstage = 1;

spr_stage1 = S_defend_meter_empty;
spr_stage2 = S_defend_meter_1;
spr_stage3 = S_defend_meter_2;
spr_stage4 = S_defend_meter_3;
spr_stage5 = S_defend_meter_4;
spr_stage6 = S_defend_meter_full;

hold_frames = 0;
total_hold_frames = 0;
hold_duration_per_stage = 35;
maxholdframes = 100
revert_frames = -15;