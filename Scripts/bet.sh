
#!/home/nouransbme/3.2/fmri/Data


for idx in `seq -w 1 26` ; do
    sub_idx="sub-$idx"
    echo $sub_idx
    echo "===> Starting Skull Striiping of $sub_idx with 0.2 f "
# To know the path of (/fsl/bin/bet) use command 'find / -name bet'
/usr/local/fsl/bin/bet /home/nouran/sbme/3.2/fmri/Data/sub-${idx}/anat/sub-${idx}_T1w /home/nouran/sbme/3.2/fmri/Data/sub-${idx}/anat/sub-${idx}_T1w_brain_skull_stripped_0.2th  -f 0.2 -g 0

done
