#!/home/nouran/sbme/3.2/fmri/Data/first_level.sh

for idx in {1..26} ; do
    if [[ $idx -lt 10 ]]; then
        sub="sub-0$idx"
    else
        sub="sub-$idx"
    fi

    echo " Start first level analysis of $sub"

    # Create subject directory if it doesn't exist
    mkdir -p "/home/nouran/sbme/3.2/fmri/Data/${sub}/${sub}.feat"

    # Copy the design files into the subject directory.
    # Copy Full design file to a new file
    cp /home/nouran/sbme/3.2/fmri/Data/full_design_sub-01_run-01.fsf "/home/nouran/sbme/3.2/fmri/Data/${sub}/${sub}.feat/design_${sub}_run-01.fsf"

    # change “sub-01” to the current subject number in design files
    sed -i "s|sub-01|${sub}|g" "/home/nouran/sbme/3.2/fmri/Data/${sub}/${sub}.feat/design_${sub}_run-01.fsf"

    # run feat design files for run 1
    echo "===> Start run 1"
    feat "/home/nouran/sbme/3.2/fmri/Data/${sub}/${sub}.feat/design_${sub}_run-01.fsf"

    # change run1 to run2 in design file 
    sed -i "s|run-1|run-2|g" "/home/nouran/sbme/3.2/fmri/Data/${sub}/${sub}.feat/design_${sub}_run-01.fsf"
    sed -i "s|run-01|run-02|g" "/home/nouran/sbme/3.2/fmri/Data/${sub}/${sub}.feat/design_${sub}_run-01.fsf"
    sed -i "s|run1|run2|g" "/home/nouran/sbme/3.2/fmri/Data/${sub}/${sub}.feat/design_${sub}_run-01.fsf"

    # run feat design files
    echo "===> Start run 2"
    feat "/home/nouran/sbme/3.2/fmri/Data/${sub}/${sub}.feat/design_${sub}_run-01.fsf"
done

